//
//  ContentView 2.swift
//  ReWord
//
//  Created by 福島克侑 on 2026/04/27.
//


import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuizViewModel()
    
    var body: some View {
        ZStack {
            // 背景色を薄いグレーにしてカードを際立たせる
            Color(.systemGroupedBackground).ignoresSafeArea()
            
            VStack(spacing: 24) {
                // プログレス表示
                Text("Question \(viewModel.currentIndex + 1) of \(viewModel.questions.count)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                
                // 問題文カード
                VStack(spacing: 16) {
                    Text("Definition")
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
                        .frame(maxWidth: .infinity)
                        .minHeight(100)
                }
                .padding(24)
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
                
                // 選択肢
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
                        .disabled(viewModel.isCorrect != nil) // 回答後はボタン無効
                    }
                }
                
                // ヒント表示
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
                
                // 下部アクション
                HStack {
                    Button(action: { withAnimation { viewModel.showHint.toggle() } }) {
                        Label("Hint", systemImage: "lightbulb")
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.bordered)
                    .tint(.orange)
                    .opacity(viewModel.isCorrect == nil ? 1 : 0) // 解答後は非表示
                    
                    if viewModel.isCorrect != nil {
                        Button(action: { withAnimation { viewModel.nextQuestion() } }) {
                            Text("Next Question")
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

// 選択肢ボタンのコンポーネント化
struct OptionButton: View {
    let title: String
    let isSelected: Bool
    let isCorrect: Bool?
    let isAnswer: Bool
    let action: () -> Void
    
    var backgroundColor: Color {
        if let isCorrect = isCorrect {
            if isAnswer { return .green }
            if isSelected && !isCorrect { return .red }
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
                    if isAnswer { Image(systemName: "checkmark.circle.fill").foregroundColor(.white) }
                    else if isSelected && !isCorrect { Image(systemName: "xmark.circle.fill").foregroundColor(.white) }
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