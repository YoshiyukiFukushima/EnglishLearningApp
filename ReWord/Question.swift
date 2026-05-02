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
        ),
        // MARK: - Beginner (20問)
        Question(
            text: "A place where airplanes land and take off.",
            answer: "Airport",
            options: ["Station", "Airport", "Harbor", "Hospital"],
            hint: "飛行機が離着陸する場所です。",
            level: .beginner
        ),
        Question(
            text: "A structure built over a river or road so people can cross.",
            answer: "Bridge",
            options: ["Bridge", "Tower", "Tunnel", "Castle"],
            hint: "川や道路の上に作られた「橋」です。",
            level: .beginner
        ),
        Question(
            text: "A device used for taking photos or recording videos.",
            answer: "Camera",
            options: ["Radio", "Telephone", "Camera", "Computer"],
            hint: "写真や動画を撮るための機械です。",
            level: .beginner
        ),
        Question(
            text: "A book or app that explains the meanings of words.",
            answer: "Dictionary",
            options: ["Magazine", "Newspaper", "Textbook", "Dictionary"],
            hint: "言葉の意味を調べるための「辞書」です。",
            level: .beginner
        ),
        Question(
            text: "Having nothing inside.",
            answer: "Empty",
            options: ["Full", "Empty", "Heavy", "Dirty"],
            hint: "中に何もない、「空（から）」の状態です。",
            level: .beginner
        ),
        Question(
            text: "A person you like and spend time with.",
            answer: "Friend",
            options: ["Enemy", "Stranger", "Friend", "Teacher"],
            hint: "仲良くしている「友達」のことです。",
            level: .beginner
        ),
        Question(
            text: "A person who is invited to visit someone's home or a hotel.",
            answer: "Guest",
            options: ["Host", "Owner", "Guest", "Worker"],
            hint: "招かれた「客」やホテルの宿泊客のことです。",
            level: .beginner
        ),
        Question(
            text: "Wanting or needing food.",
            answer: "Hungry",
            options: ["Sleepy", "Thirsty", "Tired", "Hungry"],
            hint: "お腹が空いている状態を表します。",
            level: .beginner
        ),
        Question(
            text: "A piece of land completely surrounded by water.",
            answer: "Island",
            options: ["Mountain", "Island", "Forest", "Desert"],
            hint: "周りを水に囲まれた「島」のことです。",
            level: .beginner
        ),
        Question(
            text: "The act of traveling from one place to another.",
            answer: "Journey",
            options: ["Journey", "Stay", "Meeting", "Rest"],
            hint: "ある場所から別の場所への「旅行」「道のり」です。",
            level: .beginner
        ),
        Question(
            text: "A room where food is cooked and prepared.",
            answer: "Kitchen",
            options: ["Bedroom", "Bathroom", "Kitchen", "Garage"],
            hint: "料理を作る「台所」です。",
            level: .beginner
        ),
        Question(
            text: "The system of words used by people to communicate.",
            answer: "Language",
            options: ["Music", "Science", "History", "Language"],
            hint: "人々がコミュニケーションに使う「言語」です。",
            level: .beginner
        ),
        Question(
            text: "Something that is not correct; an error.",
            answer: "Mistake",
            options: ["Answer", "Mistake", "Fact", "Success"],
            hint: "間違っていること、「ミス」のことです。",
            level: .beginner
        ),
        Question(
            text: "A person who lives near you.",
            answer: "Neighbor",
            options: ["Neighbor", "Family", "Tourist", "Doctor"],
            hint: "近所に住んでいる人のことです。",
            level: .beginner
        ),
        Question(
            text: "A very large body of salt water.",
            answer: "Ocean",
            options: ["River", "Lake", "Pond", "Ocean"],
            hint: "とても大きなしょっぱい水域、「海」です。",
            level: .beginner
        ),
        Question(
            text: "To say that you will definitely do something.",
            answer: "Promise",
            options: ["Refuse", "Forget", "Promise", "Wait"],
            hint: "必ずやると「約束する」ことです。",
            level: .beginner
        ),
        Question(
            text: "Making very little noise.",
            answer: "Quiet",
            options: ["Noisy", "Loud", "Quiet", "Bright"],
            hint: "音があまりしない、「静かな」状態です。",
            level: .beginner
        ),
        Question(
            text: "The cause of an event or situation.",
            answer: "Reason",
            options: ["Result", "Reason", "Question", "Idea"],
            hint: "出来事や状況の「理由」「原因」です。",
            level: .beginner
        ),
        Question(
            text: "The warmest season of the year.",
            answer: "Summer",
            options: ["Winter", "Spring", "Autumn", "Summer"],
            hint: "一年で一番暑い季節、「夏」です。",
            level: .beginner
        ),
        Question(
            text: "A round object that turns around to make a car or bicycle move.",
            answer: "Wheel",
            options: ["Engine", "Window", "Door", "Wheel"],
            hint: "車や自転車を動かすための「車輪」です。",
            level: .beginner
        ),
        
        // MARK: - Intermediate (20問)
        Question(
            text: "To say sorry for doing something wrong.",
            answer: "Apologize",
            options: ["Apologize", "Forgive", "Complain", "Argue"],
            hint: "悪いことをしたと「謝る」という意味です。",
            level: .intermediate
        ),
        Question(
            text: "The way a person acts or does things.",
            answer: "Behavior",
            options: ["Opinion", "Behavior", "Feeling", "Appearance"],
            hint: "人の「振る舞い」や「行動」のことです。",
            level: .intermediate
        ),
        Question(
            text: "A person you work with, especially in a profession or a business.",
            answer: "Colleague",
            options: ["Boss", "Client", "Colleague", "Student"],
            hint: "職場の「同僚」のことです。",
            level: .intermediate
        ),
        Question(
            text: "To become smaller in size or amount.",
            answer: "Decrease",
            options: ["Increase", "Decrease", "Remain", "Expand"],
            hint: "サイズや量が「減る」「減少する」ことです。",
            level: .intermediate
        ),
        Question(
            text: "The air, water, and land where people, animals, and plants live.",
            answer: "Environment",
            options: ["Society", "Economy", "Environment", "Industry"],
            hint: "人間や動植物が生きている「環境」のことです。",
            level: .intermediate
        ),
        Question(
            text: "Happening often.",
            answer: "Frequent",
            options: ["Rare", "Frequent", "Sudden", "Slow"],
            hint: "「頻繁な」「よく起こる」という意味の形容詞です。",
            level: .intermediate
        ),
        Question(
            text: "To produce or create something, like power or ideas.",
            answer: "Generate",
            options: ["Destroy", "Consume", "Generate", "Prevent"],
            hint: "電力やアイデアなどを「生み出す」「発生させる」ことです。",
            level: .intermediate
        ),
        Question(
            text: "To pause before doing something because you are not sure.",
            answer: "Hesitate",
            options: ["Decide", "Hesitate", "Rush", "Continue"],
            hint: "自信がなくて「ためらう」「躊躇する」ことです。",
            level: .intermediate
        ),
        Question(
            text: "To become larger in size, number, or amount.",
            answer: "Increase",
            options: ["Decrease", "Reduce", "Drop", "Increase"],
            hint: "サイズや数が「増える」「増加する」ことです。",
            level: .intermediate
        ),
        Question(
            text: "To form an opinion about something after thinking carefully.",
            answer: "Judge",
            options: ["Guess", "Judge", "Ignore", "Accept"],
            hint: "よく考えた上で「判断する」ことです。",
            level: .intermediate
        ),
        Question(
            text: "Information and understanding that you have in your mind.",
            answer: "Knowledge",
            options: ["Memory", "Knowledge", "Question", "Doubt"],
            hint: "頭の中にある情報、「知識」のことです。",
            level: .intermediate
        ),
        Question(
            text: "Bags and cases that you carry when you are traveling.",
            answer: "Luggage",
            options: ["Furniture", "Clothes", "Luggage", "Tickets"],
            hint: "旅行の時に持ち運ぶ「手荷物」のことです。",
            level: .intermediate
        ),
        Question(
            text: "To find the size, weight, or speed of something.",
            answer: "Measure",
            options: ["Guess", "Measure", "Build", "Draw"],
            hint: "大きさや重さを「測る」ことです。",
            level: .intermediate
        ),
        Question(
            text: "To see or become aware of something.",
            answer: "Notice",
            options: ["Hide", "Miss", "Notice", "Forget"],
            hint: "何かに「気づく」ことです。",
            level: .intermediate
        ),
        Question(
            text: "To happen, especially without being planned.",
            answer: "Occur",
            options: ["Stop", "Occur", "Wait", "Plan"],
            hint: "予期せず「起こる」「発生する」ことです。",
            level: .intermediate
        ),
        Question(
            text: "Able to wait calmly for a long time without getting angry.",
            answer: "Patient",
            options: ["Angry", "Patient", "Quick", "Nervous"],
            hint: "イライラせずに待つことができる、「忍耐強い」様子です。",
            level: .intermediate
        ),
        Question(
            text: "How good or bad something is.",
            answer: "Quality",
            options: ["Quantity", "Price", "Quality", "Shape"],
            hint: "物の「質」や「品質」のことです。",
            level: .intermediate
        ),
        Question(
            text: "To know someone or something because you have seen them before.",
            answer: "Recognize",
            options: ["Forget", "Recognize", "Meet", "Teach"],
            hint: "以前見たことがあるので「それとわかる」「認識する」ことです。",
            level: .intermediate
        ),
        Question(
            text: "To mention an idea or a plan for other people to think about.",
            answer: "Suggest",
            options: ["Order", "Suggest", "Force", "Deny"],
            hint: "アイデアや計画を「提案する」ことです。",
            level: .intermediate
        ),
        Question(
            text: "Showing the usual characteristics of a person or thing.",
            answer: "Typical",
            options: ["Unusual", "Special", "Typical", "Rare"],
            hint: "「典型的な」「いつもの」という意味の形容詞です。",
            level: .intermediate
        ),
        
        // MARK: - Hard (20問)
        Question(
            text: "Having a good effect or result; helpful.",
            answer: "Beneficial",
            options: ["Harmful", "Useless", "Beneficial", "Dangerous"],
            hint: "良い影響がある、「有益な」という意味です。",
            level: .advanced
        ),
        Question(
            text: "To hide something carefully so it cannot be seen.",
            answer: "Conceal",
            options: ["Reveal", "Display", "Conceal", "Expose"],
            hint: "見えないように注意深く「隠す」ことです。",
            level: .advanced
        ),
        Question(
            text: "To become worse in condition or quality.",
            answer: "Deteriorate",
            options: ["Improve", "Recover", "Deteriorate", "Develop"],
            hint: "状態や品質が「悪化する」ことです。",
            level: .advanced
        ),
        Question(
            text: "To show that something is very important.",
            answer: "Emphasize",
            options: ["Ignore", "Emphasize", "Forget", "Hide"],
            hint: "何かが重要であると「強調する」ことです。",
            level: .advanced
        ),
        Question(
            text: "To attract or interest someone very much.",
            answer: "Fascinate",
            options: ["Bore", "Annoy", "Fascinate", "Tire"],
            hint: "人を強く惹きつける、「魅了する」ことです。",
            level: .advanced
        ),
        Question(
            text: "Real and exactly what it appears to be; not fake.",
            answer: "Genuine",
            options: ["Artificial", "Fake", "Genuine", "False"],
            hint: "偽物ではない、「本物の」という意味です。",
            level: .advanced
        ),
        Question(
            text: "Unfriendly and not liking someone or something.",
            answer: "Hostile",
            options: ["Friendly", "Welcoming", "Hostile", "Kind"],
            hint: "友好的でない、「敵意のある」状態です。",
            level: .advanced
        ),
        Question(
            text: "To start using a plan, system, or law.",
            answer: "Implement",
            options: ["Cancel", "Implement", "Delay", "Refuse"],
            hint: "計画や法律などを「実行する」「導入する」ことです。",
            level: .advanced
        ),
        Question(
            text: "To put something in danger of being lost or harmed.",
            answer: "Jeopardize",
            options: ["Protect", "Save", "Jeopardize", "Guard"],
            hint: "何かを危険にさらす、「危うくする」ことです。",
            level: .advanced
        ),
        Question(
            text: "Producing a lot of money or profit.",
            answer: "Lucrative",
            options: ["Unprofitable", "Lucrative", "Failing", "Poor"],
            hint: "たくさんのお金を生み出す、「利益の上がる」という意味です。",
            level: .advanced
        ),
        Question(
            text: "Required by a law or rule; you must do it.",
            answer: "Mandatory",
            options: ["Optional", "Voluntary", "Mandatory", "Free"],
            hint: "法律や規則で「義務的な」「必須の」という意味です。",
            level: .advanced
        ),
        Question(
            text: "To not give enough care or attention to people or things.",
            answer: "Neglect",
            options: ["Care", "Protect", "Neglect", "Support"],
            hint: "十分な注意や世話をしない、「怠る」「ネグレクトする」ことです。",
            level: .advanced
        ),
        Question(
            text: "Not known to many people; hard to understand.",
            answer: "Obscure",
            options: ["Clear", "Famous", "Obscure", "Popular"],
            hint: "あまり知られていない、または「曖昧な」状態です。",
            level: .advanced
        ),
        Question(
            text: "To make someone do or believe something by giving them good reasons.",
            answer: "Persuade",
            options: ["Discourage", "Prevent", "Persuade", "Stop"],
            hint: "良い理由を挙げて人を「説得する」ことです。",
            level: .advanced
        ),
        Question(
            text: "Not wanting to do something and therefore slow to do it.",
            answer: "Reluctant",
            options: ["Eager", "Willing", "Reluctant", "Ready"],
            hint: "気が進まない、「しぶしぶの」状態です。",
            level: .advanced
        ),
        Question(
            text: "To watch a person or activity to make sure everything is done correctly.",
            answer: "Supervise",
            options: ["Ignore", "Follow", "Supervise", "Obey"],
            hint: "正しく行われているか「監督する」ことです。",
            level: .advanced
        ),
        Question(
            text: "Very great in amount, size, or degree.",
            answer: "Tremendous",
            options: ["Tiny", "Tremendous", "Slight", "Little"],
            hint: "量や程度が「とてつもない」「巨大な」という意味です。",
            level: .advanced
        ),
        Question(
            text: "Agreed by everyone in a group.",
            answer: "Unanimous",
            options: ["Divided", "Unanimous", "Opposed", "Split"],
            hint: "グループ全員が賛成している、「満場一致の」状態です。",
            level: .advanced
        ),
        Question(
            text: "Able to be easily physically or mentally hurt.",
            answer: "Vulnerable",
            options: ["Strong", "Protected", "Vulnerable", "Safe"],
            hint: "心身が傷つきやすい、「もろい」「脆弱な」状態です。",
            level: .advanced
        ),
        Question(
            text: "To hold back or keep someone from doing something.",
            answer: "Restrain",
            options: ["Encourage", "Restrain", "Help", "Push"],
            hint: "行動などを「抑制する」「制止する」ことです。",
            level: .advanced
        )
    ]
}
