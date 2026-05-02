import SwiftUI

struct SettingsView: View {
    // 以前設定したタイマー機能の変数も維持しています
    @AppStorage("quizLimitTime") private var quizLimitTime: Double = 10.0
    @AppStorage("isTimerEnabled") private var isTimerEnabled: Bool = true
    
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
            
            Section(header: Text("ReWordについて")) {
                // ☕️ ここでコーヒーアイコンを使って、息抜き感を演出します
                NavigationLink(destination: StoryView(item: .developerStory)) {
                    Label("開発者のぼやきとアプリの裏側", systemImage: "cup.and.saucer.fill")
                }
            }
            
            // 💡 バージョン情報を復活させました
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
