import Foundation
import SwiftUI
import Combine

class QuizViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentIndex = 0
    @Published var selectedOption: WordOption? = nil
    @Published var currentOptions: [WordOption] = []
    @Published var showHint = false
    @Published var isCorrect: Bool? = nil
    @Published var score = 0
    @Published var isFinished = false
    @Published var timeRemaining: Double = 10.0
    @Published var timerActive = false
    @Published var canShowHintButton = false
    
    private var mainTimer: AnyCancellable?
    private var currentLevel: QuestionLevel = .beginner

    var currentQuestion: Question {
        questions.indices.contains(currentIndex) ? questions[currentIndex] : Question.samples[0]
    }

    // 💡 復活：福島さんの温かいフィードバックメッセージ
    var feedbackMessage: String {
        switch score {
        case 5:
            return "パーフェクト！天才だ、、、"
        case 3...4:
            return "いい調子！継続は力なり"
        case 1...2:
            return "まだまだこれから！伸び代しかない！"
        default:
            return "アプリを開いただけでもえらすぎる！"
        }
    }

    func startQuiz(level: QuestionLevel) {
        self.currentLevel = level
        let filtered = Question.samples.filter { $0.level == level }
        questions = Array(filtered.shuffled().prefix(5))
        currentIndex = 0
        score = 0
        isFinished = false
        resetState()
    }

    func startTimer() {
        let isTimerEnabled = UserDefaults.standard.bool(forKey: "isTimerEnabled")
        let limit = UserDefaults.standard.double(forKey: "quizLimitTime")
        let actualLimit = limit > 0 ? limit : 10.0
        
        timeRemaining = actualLimit
        timerActive = true
        
        mainTimer?.cancel()
        mainTimer = Timer.publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self, self.timerActive else { return }
                
                self.timeRemaining -= 0.1
                    
                if isTimerEnabled && self.timeRemaining <= 0 {
                    self.timerActive = false
                    self.isCorrect = false
                }
                
                // ヒントボタン：5秒経過で出現
                let elapsed = actualLimit - self.timeRemaining
                if elapsed >= 5.0 && !self.canShowHintButton {
                    withAnimation { self.canShowHintButton = true }
                }
            }
    }

    func checkAnswer(_ option: WordOption) {
        timerActive = false
        selectedOption = option
        isCorrect = (option.word == currentQuestion.answer)
        if isCorrect == true { score += 1 }
    }

    func nextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
            resetState()
        } else {
            isFinished = true
        }
    }

    func restartQuiz() { startQuiz(level: currentLevel) }

    private func resetState() {
        selectedOption = nil
        isCorrect = nil
        showHint = false
        canShowHintButton = false
        currentOptions = currentQuestion.options.shuffled()
        startTimer()
    }
}
