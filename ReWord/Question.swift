import Foundation

// --- 難易度を定義する（将来のリスト表示用） ---
enum QuestionLevel: String {
    case beginner = "初級"
    case intermediate = "中級"
    case advanced = "上級"
}

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let answer: String
    let options: [String]
    let hint: String
    let level: QuestionLevel // ここに難易度を追加
}

extension Question {
    static let samples = [
        Question(
            text: "To make something better.",
            answer: "Improve",
            options: ["Improve", "Destroy", "Ignore", "Maintain"],
            hint: "システムや状況などを「より良くする」という意味の動詞です。",
            level: .beginner // 難易度を設定
        ),
        Question(
            text: "One of the foods that you use to make a particular dish.",
            answer: "Ingredient",
            options: ["Equipment", "Ingredient", "Recipe", "Menu"],
            hint: "料理に使われる「材料」や「成分」のことです。",
            level: .intermediate
        ),
        Question(
            text: "A group of people who watch or listen to a play, concert, or television program.",
            answer: "Audience",
            options: ["Audience", "Passenger", "Customer", "Patient"],
            hint: "ライブやテレビ番組などを観ている「観客」や「視聴者」です。",
            level: .beginner
        ),
        Question(
            text: "To travel regularly between work and home.",
            answer: "Commute",
            options: ["Commute", "Explore", "Migrate", "Wander"],
            hint: "電車などを使って「通勤・通学する」という動作を表します。",
            level: .intermediate
        ),
        Question(
            text: "An activity that you do for pleasure when you are not working.",
            answer: "Hobby",
            options: ["Job", "Hobby", "Duty", "Habit"],
            hint: "仕事以外の時間で楽しむ「趣味」のことです。",
            level: .beginner
        ),
        Question(
            text: "A plan that gives expected times for different things to happen.",
            answer: "Schedule",
            options: ["Schedule", "Result", "Reason", "Promise"],
            hint: "予定や計画の「スケジュール」「時間割」のことです。",
            level: .beginner
        ),
        Question(
            text: "Providing physical ease and relaxation.",
            answer: "Comfortable",
            options: ["Comfortable", "Nervous", "Strict", "Painful"],
            hint: "部屋や服などが「快適な」「心地よい」という意味の形容詞です。",
            level: .beginner
        ),
        Question(
            text: "To do something special for an important event or occasion.",
            answer: "Celebrate",
            options: ["Celebrate", "Complain", "Apologize", "Warn"],
            hint: "卒業や就職などの大切なお祝い事で「祝う」という意味です。",
            level: .beginner
        ),
        Question(
            text: "To fix something that is broken or damaged.",
            answer: "Repair",
            options: ["Repair", "Borrow", "Invent", "Destroy"],
            hint: "壊れたものを「修理する」「直す」という意味です。",
            level: .beginner
        ),
        Question(
            text: "A machine or system that connects computers around the world.",
            answer: "Network",
            options: ["Network", "Factory", "Vehicle", "Library"],
            hint: "コンピュータなどをつなぐ「通信網」のことです。",
            level: .intermediate
        )
    ]
}
