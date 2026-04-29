//
//  Question 2.swift
//  ReWord
//
//  Created by 福島克侑 on 2026/04/27.
//


import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let answer: String
    let options: [String]
    let hint: String
}

// データ管理用のエクステンション
extension Question {
    static let samples = [
        Question(
            text: "A building where people can see historical, scientific, or artistic objects.",
            answer: "Museum",
            options: ["Library", "Museum", "Theater", "Stadium"],
            hint: "歴史的なものや芸術作品を展示する場所です。"
        ),
        Question(
            text: "A large printed picture used for decoration.",
            answer: "Poster",
            options: ["Poster", "Letter", "Email", "Ticket"],
            hint: "壁に貼る大きな紙です。"
        )
    ]
}