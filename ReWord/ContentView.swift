import SwiftUI

// --- 1. アプリの起点となるホーム画面 ---
struct ContentView: View {
    var body: some View {
        // NavigationStackを使うことで、別の画面への遷移（リンク）が可能になります
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()
                
                VStack(spacing: 40) {
                    // タイトルロゴ風
                    VStack(spacing: 8) {
                        Text("ReWord")
                            .font(.system(size: 48, weight: .black, design: .rounded))
                            .foregroundColor(.blue)
                        
                        Text("英語で学ぶ英単語")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 60)
                    
                    Text("難易度を選んでスタート！")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    // 難易度選択ボタン
                    VStack(spacing: 16) {
                        LevelButton(level: .beginner, color: .green)
                        LevelButton(level: .intermediate, color: .orange)
                        LevelButton(level: .advanced, color: .red) // 現在データがない場合は空になりますが準備として配置
                    }
                    .padding(.horizontal, 32)
                    
                    Spacer()
                }
            }
            // 右上に設定画面へのボタンを配置
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

// レベル選択ボタンの専用部品
struct LevelButton: View {
    let level: QuestionLevel
    let color: Color
    
    var body: some View {
        // 押すとQuizContainerViewへ移動し、選んだレベルを渡す
        NavigationLink(destination: QuizContainerView(level: level)) {
            HStack {
                Text(level.rawValue)
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "play.circle.fill")
                    .font(.title2)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(16)
            .shadow(color: color.opacity(0.3), radius: 8, x: 0, y: 4)
        }
    }
}

// --- 2. クイズ画面と結果画面を管理するコンテナ ---
struct QuizContainerView: View {
    let level: QuestionLevel
    @StateObject private var viewModel = QuizViewModel()
    
    // 💡 画面を閉じて前に（ホームに）戻るための環境変数
    @Environment(\.dismiss) var dismiss
    
    // 💡 アラートを表示するかどうかを管理する状態変数
    @State private var showingExitAlert = false
    
    var body: some View {
        Group {
            if viewModel.isFinished {
                ResultView(viewModel: viewModel)
            } else {
                if viewModel.questions.isEmpty {
                    VStack {
                        Text("このレベルの問題はまだありません。")
                            .foregroundColor(.secondary)
                    }
                } else {
                    QuizView(viewModel: viewModel)
                }
            }
        }
        .onAppear {
            viewModel.startQuiz(level: level)
        }
        // スワイプで勝手に戻るのと、標準の「＜ Back」ボタンを隠す
        .navigationBarBackButtonHidden(true)
        
        // 💡 ここから追加：ナビゲーションバーに「✖️」ボタンを配置
        .toolbar {
            // クイズが終了していない時だけ左上に表示
            if !viewModel.isFinished {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showingExitAlert = true // ボタンを押すとアラートのスイッチがONになる
                    }) {
                        Image(systemName: "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(8) // タップしやすいように少し余白を持たせる
                    }
                }
            }
        }
        
        // 💡 アラートの設計
        .alert("クイズを終了しますか？", isPresented: $showingExitAlert) {
            // role: .destructive にすると文字が赤くなり、「注意が必要な操作」だと伝わります
            Button("終了する", role: .destructive) {
                dismiss() // ホームに戻る
            }
            // role: .cancel は安全なキャンセル操作
            Button("続ける", role: .cancel) {
                // 何もしない（アラートが閉じてクイズに戻る）
            }
        } message: {
            Text("現在の進捗やスコアは失われます。")
        }
    }
}

// --- 3. 設定画面（プレースホルダー） ---
struct SettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("About")) {
                Text("Version 1.0.0")
            }
        }
        .navigationTitle("設定")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// --- クイズ画面（元のContentViewの中身） ---
struct QuizView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            VStack(spacing: 24) {
                // プログレス表示（5問中何問目か）
                Text("Question \(viewModel.currentIndex + 1) of \(viewModel.questions.count)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                
                VStack(spacing: 16) {
                    Text("Definition - \(viewModel.currentQuestion.level.rawValue)") // 難易度をチラ見せ
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.blue.opacity(0.1))
                        .foregroundColor(.blue)
                        .cornerRadius(8)
                    
                    Text(viewModel.currentQuestion.text)
                        .font(.title3)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, minHeight: 100)
                }
                .padding(24)
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
                
                VStack(spacing: 12) {
                    ForEach(viewModel.currentQuestion.options, id: \.self) { option in
                        OptionButton(
                            title: option,
                            isSelected: viewModel.selectedOption == option,
                            isCorrect: viewModel.isCorrect,
                            isAnswer: option == viewModel.currentQuestion.answer
                        ) {
                            withAnimation(.spring()) {
                                viewModel.checkAnswer(option)
                            }
                        }
                        .disabled(viewModel.isCorrect != nil)
                    }
                }
                
                if viewModel.showHint {
                    Text("💡 \(viewModel.currentQuestion.hint)")
                        .font(.subheadline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange.opacity(0.1))
                        .foregroundColor(.orange)
                        .cornerRadius(12)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                Spacer()
                
                HStack {
                    Button(action: { withAnimation { viewModel.showHint.toggle() } }) {
                        Label("Hint", systemImage: "lightbulb")
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.bordered)
                    .tint(.orange)
                    .opacity(viewModel.isCorrect == nil ? 1 : 0)
                    
                    if viewModel.isCorrect != nil {
                        Button(action: { withAnimation { viewModel.nextQuestion() } }) {
                            Text(viewModel.currentIndex == viewModel.questions.count - 1 ? "See Results" : "Next Question")
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    }
                }
            }
            .padding(24)
        }
    }
}

struct ResultView: View {
    @ObservedObject var viewModel: QuizViewModel
    @Environment(\.dismiss) var dismiss // 画面を閉じて前に戻るための魔法の変数
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Quiz Completed!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                VStack {
                    Text("\(viewModel.score)")
                        .font(.system(size: 80, weight: .black))
                        .foregroundColor(.blue)
                    Text("out of \(viewModel.questions.count)")
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Circle().fill(Color(.systemBackground)).frame(width: 200, height: 200).shadow(radius: 10))
                .padding(.vertical, 20)
                
                Text(viewModel.feedbackMessage)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                VStack(spacing: 16) {
                    // もう一度遊ぶボタン
                    Button(action: {
                        withAnimation { viewModel.restartQuiz() }
                    }) {
                        Text("もう一度挑戦する")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    // ホームに戻るボタン（ここを追加）
                    Button(action: {
                        dismiss() // 画面を閉じてNavigationStackの元（ホーム）に戻る
                    }) {
                        Text("ホームに戻る")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    .tint(.secondary)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
            .padding()
        }
        // 結果画面ではスワイプで戻れるようにし、タイトルも消す
        .navigationBarBackButtonHidden(true)
    }
}
struct OptionButton: View {
    let title: String
    let isSelected: Bool
    let isCorrect: Bool?
    let isAnswer: Bool
    let action: () -> Void
    
    var backgroundColor: Color {
        if let isCorrect = isCorrect {
            if isAnswer { return .green } // 正解の選択肢は緑
            if isSelected && !isCorrect { return .red } // 選んだ間違いの選択肢は赤
        }
        return isSelected ? .blue : Color(.systemBackground)
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(isSelected || (isCorrect != nil && isAnswer) ? .white : .primary)
                
                Spacer()
                
                if let isCorrect = isCorrect {
                    if isAnswer {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(.white)
                    } else if isSelected && !isCorrect {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.white)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
        }
    }
}
