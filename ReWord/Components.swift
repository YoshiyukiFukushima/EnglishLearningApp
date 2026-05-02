import SwiftUI

struct LevelButton: View {
    let level: QuestionLevel
    let color: Color
    var body: some View {
        NavigationLink(destination: QuizContainerView(level: level)) {
            HStack {
                Text(level.rawValue).font(.title3).fontWeight(.bold)
                Spacer()
                Image(systemName: "play.circle.fill").font(.title2)
            }
            .padding().frame(maxWidth: .infinity)
            .background(color).foregroundColor(.white).cornerRadius(16)
        }
    }
}

struct OptionButton: View {
    let title: String
    let meaning: String?
    let isSelected: Bool
    let isCorrect: Bool?
    let isAnswer: Bool
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title).font(.headline)
                    .foregroundColor(isSelected || (isCorrect != nil && isAnswer) ? .white : .primary)
                Spacer()
                // 💡 追加：枠内の右側に意味をそっと表示
                if let meaning = meaning {
                    Text(" ： \(meaning)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    // 選んだ間違い選択肢（赤背景）の時は白文字、それ以外（白背景）はグレー文字で馴染ませる
                    .foregroundColor(isSelected && isCorrect == false ? .white : .secondary)
                    .transition(.opacity)
                }
                Spacer()
                // 答え合わせのアイコン
                if let isCorrect = isCorrect {
                    if isAnswer {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(.white)
                    }
                    else if isSelected && !isCorrect {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.white)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isCorrect != nil ? (isAnswer ? .green : (isSelected ? .red : Color(.systemBackground))) : (isSelected ? .blue : Color(.systemBackground)))
            .cornerRadius(15)
            .shadow(radius: 2)
        }
    }
}

struct Center<Content: View>: View {
    let content: () -> Content
    var body: some View {
        HStack { Spacer(); content(); Spacer() }
    }
}
