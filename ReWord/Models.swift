import Foundation
import SwiftUI

enum QuestionLevel: String, CaseIterable {
    case beginner = "初級"
    case intermediate = "中級"
    case advanced = "上級"
}

struct WordOption: Identifiable, Hashable {
    let id = UUID()
    let word: String
    let meaning: String
}

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let answer: String
    let options: [WordOption]
    let hint: String
    let level: QuestionLevel
}

// 開発ストーリー用のデータ
struct StoryItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let subtitle: String
    let content: String
}

extension Question {
    static let samples: [Question] = [
        Question(
            text: "A person who designs, builds, or maintains engines, machines, or public works.",
            answer: "engineer",
            options: [
                WordOption(word: "engineer", meaning: "エンジニア"),
                WordOption(word: "teacher", meaning: "教師"),
                WordOption(word: "doctor", meaning: "医師"),
                WordOption(word: "artist", meaning: "芸術家")
            ],
            hint: "エンジニア：機関や機械を設計・建設・保守する人",
            level: .beginner
        )
    ]
}

extension StoryItem {
    static let developerStory = StoryItem(
        icon: "person.fill",
        title: "開発者ストーリー",
        subtitle: "このアプリに込めた想い",
        content: "英語学習の初級者が着実にステップアップできる土台を作りたいという思いから、このアプリを開発しました。学習者を一人にせず、夜食をそっと差し出す親のような気持ちであなたをサポートします。"
    )
}
