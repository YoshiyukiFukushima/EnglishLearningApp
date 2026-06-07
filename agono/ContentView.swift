import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea()
                
                VStack(spacing: 40) {
                    header
                    
                    VStack(spacing: 16) {
                        LevelButton(level: .beginner, color: .green)
                        LevelButton(level: .intermediate, color: .orange)
                        LevelButton(level: .advanced, color: .red)
                    }
                    .padding(.horizontal, 32)
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        // ⚙️ 誰もが迷わない「歯車」アイコンに戻しました！
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
    
    private var header: some View {
        VStack(spacing: 8) {
            Text("agono")
                .font(.system(size: 48, weight: .black, design: .rounded))
                .foregroundColor(.blue)
            
            Text("英語で学ぶ英単語")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("☕️ 焦らず、自分のペースでいきましょう")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 8)
        }
        .padding(.top, 60)
    }
}
