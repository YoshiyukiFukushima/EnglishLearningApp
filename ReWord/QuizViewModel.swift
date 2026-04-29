//
//  QuizViewModel.swift
//  ReWord
//
//  Created by 福島克侑 on 2026/04/27.
//


import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var questions: [Question] = Question.samples
    @Published var currentIndex = 0
    @Published var selectedOption: String? = nil
    @Published var showHint = false
    @Published var isCorrect: Bool? = nil // nil: 未回答, true: 正解, false: 不正解
    
    var currentQuestion: Question {
        questions[currentIndex]
    }
    
    func checkAnswer(_ option: String) {
        selectedOption = option
        isCorrect = (option == currentQuestion.answer)
    }
    
    func nextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
            resetState()
        }
    }
    
    private func resetState() {
        selectedOption = nil
        isCorrect = nil
        showHint = false
    }
}