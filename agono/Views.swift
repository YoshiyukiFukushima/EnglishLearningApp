import SwiftUI

// MARK: - 2. クイズコンテナ＆リザルト画面
struct QuizContainerView: View {
    let level: QuestionLevel
    @StateObject private var viewModel = QuizViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var showingExitAlert = false
    
    var body: some View {
        Group {
            if viewModel.isFinished {
                ResultView(viewModel: viewModel)
            } else {
                QuizView(viewModel: viewModel)
            }
        }
        .onAppear {
            viewModel.startQuiz(level: level)
        }
        .navigationTitle(level.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true) // デフォルトの戻るを隠す
        .toolbar {
            if !viewModel.isFinished {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showingExitAlert = true }) {
                        Image(systemName: "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .alert("クイズを終了しますか？", isPresented: $showingExitAlert) {
            Button("終了する", role: .destructive) { dismiss() }
            Button("続ける", role: .cancel) { }
        } message: {
            Text("現在の進捗やスコアは失われます。")
        }
    }
}

// 🏆 リザルト画面（温かみ復活版）
struct ResultView: View {
    @ObservedObject var viewModel: QuizViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("お疲れ様でした！")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                // 💡 丸いスコア表示を復活
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
                
                // 💡 開発者からの温かいメッセージ[cite: 6]
                Text(viewModel.feedbackMessage)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                VStack(spacing: 16) {
                    Button(action: { withAnimation { viewModel.restartQuiz() } }) {
                        Text("もう一度挑戦する")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    Button(action: { dismiss() }) {
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
    }
}

// MARK: - 3. クイズ本編 (QuizView)
struct QuizView: View {
    @ObservedObject var viewModel: QuizViewModel
    let limitTime = UserDefaults.standard.double(forKey: "quizLimitTime")
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            VStack(spacing: 24) {
                if UserDefaults.standard.bool(forKey: "isTimerEnabled") {
                    timeProgressBar
                }
                
                Text("Question \(viewModel.currentIndex + 1) of \(viewModel.questions.count)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                
                questionCard
                optionsList
                
                if viewModel.isCorrect == nil && viewModel.showHint {
                    hintText
                }
                
                Spacer()
                bottomControls
            }
            .padding(24)
        }
    }
    
    private var timeProgressBar: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule().fill(Color.gray.opacity(0.2))
                Capsule()
                    .fill(viewModel.timeRemaining < 3 ? .red : .blue)
                    .frame(width: geo.size.width * CGFloat(viewModel.timeRemaining / (limitTime > 0 ? limitTime : 10)))
                    .animation(.linear(duration: 0.1), value: viewModel.timeRemaining) // スムーズなアニメーション
            }
        }.frame(height: 8)
    }
    
    private var questionCard: some View {
        VStack(spacing: 16) {
            Text("問題")
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
    }

    private var optionsList: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.currentOptions) { option in
                VStack(spacing: 8) {
                    OptionButton(
                        title: option.word,
                        // 💡 変更：回答後（isCorrect != nil）かつ、正解「以外」の選択肢にだけ意味を渡す
                        meaning: (viewModel.isCorrect != nil && option.word != viewModel.currentQuestion.answer) ? option.meaning : nil,
                        isSelected: viewModel.selectedOption?.id == option.id,
                        isCorrect: viewModel.isCorrect,
                        isAnswer: option.word == viewModel.currentQuestion.answer
                    ) {
                        withAnimation(.spring()) {
                            viewModel.checkAnswer(option)
                        }
                    }
                    .disabled(viewModel.isCorrect != nil)
                    
                    // 💡 修正：回答後（isCorrect != nil）のテキスト表示を分岐
                    if viewModel.isCorrect != nil {
                        if option.word == viewModel.currentQuestion.answer {
                            // 🌟 正解の単語は、情景をイメージしやすい「ヒント」を表示
                            Text("\(viewModel.currentQuestion.hint)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.bottom, 4)
                            .transition(.move(edge: .top).combined(with: .opacity))
                        }
                    }
                }
            }
        }
    }
    
    private var hintText: some View {
        Text("💡 \(viewModel.currentQuestion.hint)")
            .font(.subheadline)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange.opacity(0.1))
            .foregroundColor(.orange)
            .cornerRadius(12)
            .transition(.move(edge: .top).combined(with: .opacity))
    }

    private var bottomControls: some View {
        HStack {
            // 💡 待機中の親心メッセージ復活
            if viewModel.isCorrect == nil {
                if viewModel.canShowHintButton {
                    Button(action: { withAnimation { viewModel.showHint.toggle() } }) {
                        Label(viewModel.showHint ? "ヒントを隠す" : "そっとヒントを見る", systemImage: "lightbulb.fill")
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.bordered)
                    .tint(.orange)
                    .transition(.scale.combined(with: .opacity))
                } else {
                    Text("自分で思考タイム🕰️")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .transition(.opacity)
                }
            }
            
            Spacer()
            
            if viewModel.isCorrect != nil {
                Button(action: { withAnimation { viewModel.nextQuestion() } }) {
                    Text(viewModel.currentIndex == viewModel.questions.count - 1 ? "結果を見る" : "次の問題へ")
                        .fontWeight(.bold)
                        .padding(.horizontal, 24)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .transition(.scale.combined(with: .opacity))
            }
        }
    }
}
