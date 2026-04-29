import Foundation
import SwiftUI
import Combine

class QuizViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentIndex = 0
    @Published var selectedOption: String? = nil
    @Published var showHint = false
    @Published var isCorrect: Bool? = nil
    @Published var score = 0
    @Published var isFinished = false
    
    // 現在選択されている難易度を保持する
    var currentLevel: QuestionLevel = .beginner
    
    // init() は外から startQuiz を呼ぶ形にするので削除してOKです
    
    var currentQuestion: Question {
        questions[currentIndex]
    }
    
    var feedbackMessage: String {
        switch score {
        case 5:
            return "パーフェクト！天才だ、、、"
        case 3...4:
            return "いい調子！継続は力なり"
        case 1...2:
            return "繰り返し頑張ろう！"
        default:
            return "まだまだこれから！伸び代しかない！"
        }
    }
    
    func checkAnswer(_ option: String) {
        selectedOption = option
        isCorrect = (option == currentQuestion.answer)
        
        if isCorrect == true {
            score += 1
        }
    }
    
    func nextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
            resetState()
        } else {
            isFinished = true
        }
    }
    
    // 引数として難易度（level）を受け取るように変更
    func startQuiz(level: QuestionLevel) {
        self.currentLevel = level
        
        // 1. 選ばれた難易度と同じ問題だけを抽出（filter）
        let filteredQuestions = Question.samples.filter { $0.level == level }
        
        // 2. シャッフルして最大5問を取り出す
        questions = Array(filteredQuestions.shuffled().prefix(5))
        
        currentIndex = 0
        score = 0
        isFinished = false
        resetState()
    }
    
    // 同じ難易度でもう一度遊ぶ用
    func restartQuiz() {
        startQuiz(level: self.currentLevel)
    }
    
    private func resetState() {
        selectedOption = nil
        isCorrect = nil
        showHint = false
    }
}
