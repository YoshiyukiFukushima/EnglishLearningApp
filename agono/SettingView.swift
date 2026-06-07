import SwiftUI

struct SettingsView: View {
    @AppStorage("quizLimitTime") private var quizLimitTime: Double = 10.0
    @AppStorage("isTimerEnabled") private var isTimerEnabled: Bool = true
    
    // ☕️ カミングスーンのポップアップをコントロールする変数
    @State private var showingComingSoonAlert = false
    
    var body: some View {
        List {
            Section(header: Text("学習設定")) {
                Toggle("タイマーを有効にする", isOn: $isTimerEnabled)
                if isTimerEnabled {
                    HStack {
                        Text("制限時間")
                        Spacer()
                        Text("\(Int(quizLimitTime))秒")
                    }
                    Slider(value: $quizLimitTime, in: 5...60, step: 5)
                }
            }
            
            Section(header: Text("agonoについて")) {
                // ☕️ カミングスーン仕様のボタン
                Button(action: {
                    showingComingSoonAlert = true
                }) {
                    HStack {
                        Label {
                            Text("開発者のぼやきとアプリの裏側")
                                .foregroundColor(.primary)
                        } icon: {
                            Image(systemName: "cup.and.saucer.fill")
                                .foregroundColor(.gray) // 🎨 グレー＆塗りつぶしで統一
                        }
                        
                        Spacer()
                        
                        Text("Coming Soon...")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                // 📝 Googleフォーム（お問い合わせ）へのリンク
                Link(destination: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLScPaB4NM0uZRc4mjvUICNF64WpUpxXneT90PGv2pkTRo1YDvg/viewform?usp=dialog")!) {
                    Label {
                        Text("お問い合わせ＆メッセージ")
                            .foregroundColor(.primary)
                    } icon: {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.gray) // 🎨 グレー＆塗りつぶしで統一
                    }
                }
                
                // 🛡️ プライバシーポリシーへのリンク
                Link(destination: URL(string: "https://www.notion.so/36da516ebea180c9a927ca4c7d927fff?source=copy_link")!) {
                    Label {
                        Text("プライバシーポリシー")
                            .foregroundColor(.primary)
                    } icon: {
                        Image(systemName: "shield.fill") // 🎨 盾の塗りつぶしアイコンに変更
                            .foregroundColor(.gray) // 🎨 グレー＆塗りつぶしで統一
                    }
                }
            }
            
            Section {
                HStack {
                    Text("バージョン")
                    Spacer()
                    Text("1.0.0")
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("設定")
        .alert("現在、全力で執筆中...✍️", isPresented: $showingComingSoonAlert) {
            Button("のんびり待つ", role: .cancel) { }
        } message: {
            Text("開発者のあんな話やアプリの裏話を楽しく読んでもらえるように、ただいま絶賛準備中です。次のアップデートをどうぞお楽しみに！")
        }
    }
}

struct StoryView: View {
    let item: StoryItem
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(systemName: item.icon)
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                    .padding()
                
                Text(item.title).font(.title).fontWeight(.bold)
                Text(item.subtitle).font(.headline).foregroundColor(.secondary)
                
                Divider()
                
                Text(item.content)
                    .font(.body)
                    .lineSpacing(8)
                    .padding()
            }
        }
    }
}
