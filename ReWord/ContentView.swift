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
            Button("終了する", role: .destructive) {
                dismiss() // ホームに戻る
            }
            Button("続ける", role: .cancel) {
                // 何もしない（アラートが閉じてクイズに戻る）
            }
        } message: {
            Text("現在の進捗やスコアは失われます。")
        }
    }
}

// --- 3. 設定画面（アップデート版） ---
struct SettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("ReWordについて")) {
                // 💡 ここから開発者のストーリー画面へ飛べるようにします
                NavigationLink(destination: PhilosophyListView()) {
                    HStack(spacing: 12) {
                        Image(systemName: "cup.and.saucer.fill")
                            .foregroundColor(.brown)
                        Text("開発者のぼやきとアプリの裏側")
                            .fontWeight(.medium)
                    }
                    .padding(.vertical, 4)
                }
            }
            
            Section(header: Text("システム")) {
                Text("Version 1.0.0")
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("設定")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// --- データの設計：各コラム（部屋）の情報をまとめる ---
struct StoryItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let subtitle: String
    let content: String
}

// コラムのデータ一覧
let developerStories = [
    StoryItem(
        icon: "text.book.closed.fill",
        title: "長文が読めなかった僕",
        subtitle: "単語はわかるのに、なぜか読めない謎",
        content: """
        高校時代、僕は単語帳をひたすら暗記するマシーンでした。単語を見れば日本語の意味を即答できる。それなのに、長文になると全く読めないんです。
        
        簡単な英文でさえ、頭の中でいちいち日本語に翻訳して組み立ててしまうので、理解するのに途方もない時間がかかっていました。「単語の意味を知っている」ことと「英語が読める」ことは、全く別物だったんです。
        """
    ),
    StoryItem(
        icon: "bolt.fill",
        title: "「これだ！」と雷が落ちた瞬間",
        subtitle: "日本語に訳さないという最強の学習法",
        content: """
        「英語は日本語に訳さず、イメージで捉える」。そんな噂を耳にしました。
        
        ある日、たまたま「英語の定義を読んで、その単語を当てる」という問題に出会い、確信しました。状況をイメージしながら英語を読むことで、単語が「日本語の文字」ではなく「情景」として頭に直接定着する。
        
        これこそが、ネイティブの思考回路を作る最強の学習法だと思いました。
        """
    ),
    StoryItem(
        icon: "brain.head.profile",
        title: "挫折させない「95%」の魔法",
        subtitle: "わからない単語だらけは苦痛だから",
        content: """
        このアプリの問題は、学習者が「95%理解できる語彙」で構成されるように設計しています。
        
        知らない単語だらけの英文を読むのはただの苦痛ですが、95%わかれば残りの5%は前後の文脈から「推測」できます。この「推測して当てる」瞬間に、脳は最も英語を吸収するのです。
        """
    ),
    StoryItem(
        icon: "link",
        title: "過去の自分に助けられる仕組み",
        subtitle: "「i+1」理論と、しれっと復習",
        content: """
        ReWordはレベルが上がるごとに、以前のレベルで学んだ単語が「説明文（定義）」の中にしれっと再登場します。
        
        つまり、新しい単語を学びながら、気づかないうちに過去の単語を復習している状態（言語学でいう「i+1」の理論）を作り出しています。あなたの過去の努力が、今のあなたを必ず助けてくれます。
        """
    ),
    StoryItem(
        icon: "cup.and.saucer.fill",
        title: "夜食をそっと差し出すように",
        subtitle: "孤独な勉強のお供になりたい",
        content: """
        僕の最大の願いは、皆さんが英語を英語のまま理解する力を手に入れることです。でも、勉強は孤独で辛い時もありますよね。
        
        だからこそ、機械的なアプリではなく、頑張るあなたに夜食をそっと差し出す親のような存在でありたいと思っています。
        
        偉そうに語ってしまいましたが、実は僕自身も絶賛英語勉強中です。（TOEICは400点です。笑）
        焦らず、自分のペースで。僕も一緒に頑張ります！
        """
    )
]

// --- 廊下（コラム一覧）の画面 ---
struct PhilosophyListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // 案内文
                VStack(spacing: 8) {
                    Text("ReWordの裏側へようこそ")
                        .font(.title2)
                        .fontWeight(.black)
                    
                    Text("気になったドアを開けてみてください。\nコーヒーブレイクにどうぞ。")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
                
                // ドア（リスト）を並べる
                VStack(spacing: 16) {
                    ForEach(developerStories) { story in
                        NavigationLink(destination: StoryDetailView(story: story)) {
                            DoorCardView(story: story)
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer(minLength: 40)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

// --- ドアのデザイン（ボタンの見た目） ---
struct DoorCardView: View {
    let story: StoryItem
    
    var body: some View {
        HStack(spacing: 16) {
            // アイコン部分
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 50, height: 50)
                Image(systemName: story.icon)
                    .font(.title3)
                    .foregroundColor(.blue)
            }
            
            // タイトル部分
            VStack(alignment: .leading, spacing: 4) {
                Text(story.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(story.subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1) // 1行で省略して「続きが読みたい」感を出す
            }
            
            Spacer()
            
            // 右矢印で「入れる」ことを強調
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

// --- 部屋の中身（詳細画面） ---
struct StoryDetailView: View {
    let story: StoryItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // ヘッダーアイコン
                Center {
                    Image(systemName: story.icon)
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                }
                
                // タイトル
                VStack(spacing: 8) {
                    Text(story.title)
                        .font(.title)
                        .fontWeight(.black)
                        .multilineTextAlignment(.center)
                    
                    Text(story.subtitle)
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                
                Divider()
                
                // 本文
                Text(story.content)
                    .font(.body)
                    .lineSpacing(8) // 読みやすいように行間をあける
                    .foregroundColor(.primary)
                    .padding(.horizontal, 8)
                
                Spacer(minLength: 40)
            }
            .padding(24)
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}

// 補助ツール（真ん中寄せ用）
struct Center<Content: View>: View {
    let content: () -> Content
    var body: some View {
        HStack {
            Spacer()
            content()
            Spacer()
        }
    }
}
// --- クイズ画面 ---
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
                
                // 💡 選択肢エリア
                VStack(spacing: 12) {
                    ForEach(viewModel.currentQuestion.options, id: \.self) { option in
                        VStack(spacing: 8) {
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
                            
                            // 💡 アハ体験：正解後、正解の選択肢の下にそっと意味を表示
                            if viewModel.isCorrect != nil && option == viewModel.currentQuestion.answer {
                                Text("💡 意味: \(viewModel.currentQuestion.hint)")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                                    .padding(.bottom, 4)
                                    .transition(.move(edge: .top).combined(with: .opacity))
                            }
                        }
                    }
                }
                
                // 💡 回答前かつヒントがONのときだけ表示
                if viewModel.isCorrect == nil && viewModel.showHint {
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
                    // 💡 まだ回答していない時だけのヒントアクション
                    if viewModel.isCorrect == nil {
                        if viewModel.canShowHintButton {
                            Button(action: { withAnimation { viewModel.showHint.toggle() } }) {
                                Label(viewModel.showHint ? "ヒントを隠す" : "ヒントを見る", systemImage: "lightbulb.fill")
                                    .fontWeight(.semibold)
                            }
                            .buttonStyle(.bordered)
                            .tint(.orange)
                            .transition(.scale.combined(with: .opacity))
                        } else {
                            Text("自分で考えるタイム🕰️")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                                .transition(.opacity)
                        }
                    }
                    
                    Spacer()
                    
                    if viewModel.isCorrect != nil {
                        Button(action: { withAnimation { viewModel.nextQuestion() } }) {
                            Text(viewModel.currentIndex == viewModel.questions.count - 1 ? "See Results" : "Next Question")
                                .fontWeight(.bold)
                                .padding(.horizontal, 24)
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        .transition(.scale.combined(with: .opacity))
                    }
                }
            }
            .padding(24)
        }
    }
}

// --- 結果画面 ---
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
                    
                    // ホームに戻るボタン
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

// --- 選択肢ボタン ---
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
