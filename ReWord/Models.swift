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
        // MARK: - Beginner
        Question(
            text: "A person who is traveling in a vehicle but not driving it.",
            answer: "Passenger",
            options: [
                WordOption(word: "Passenger", meaning: "乗客"),
                WordOption(word: "Messenger", meaning: "伝言を運ぶ人"),
                WordOption(word: "Passage", meaning: "通路・一節"),
                WordOption(word: "Pioneer", meaning: "先駆者")
            ],
            hint: "電車や飛行機に乗っている「お客さん」のこと。pass（通り過ぎる）する人、というイメージだね。旅行気分で覚えてみて！",
            level: .beginner
        ),
        Question(
            text: "To be real; to live or be found in the world.",
            answer: "Exist",
            options: [
                WordOption(word: "Exist", meaning: "存在する・生きる"),
                WordOption(word: "Exit", meaning: "出口"),
                WordOption(word: "Assist", meaning: "助ける"),
                WordOption(word: "Insist", meaning: "主張する")
            ],
            hint: "そこに「存在する、ある」ということ。当たり前にあるものに感謝したくなるような、深くて大切な言葉だね。",
            level: .beginner
        ),
        Question(
            text: "An area of low land between hills or mountains.",
            answer: "Valley",
            options: [
                WordOption(word: "Valley", meaning: "谷・盆地"),
                WordOption(word: "Village", meaning: "村"),
                WordOption(word: "Volley", meaning: "ボレー・一斉射撃"),
                WordOption(word: "Value", meaning: "価値")
            ],
            hint: "山と山の間に広がる「谷」のこと。シリコンバレー（Silicon Valley）のバレーだね。低い土地をイメージしてみて！",
            level: .beginner
        ),
        Question(
            text: "A person with special knowledge or skill in a particular subject.",
            answer: "Expert",
            options: [
                WordOption(word: "Expert", meaning: "専門家・達人"),
                WordOption(word: "Export", meaning: "輸出する"),
                WordOption(word: "Except", meaning: "〜を除いて"),
                WordOption(word: "Expect", meaning: "期待する")
            ],
            hint: "ある分野の「専門家」のこと。君もこのアプリを使い続ければ、英語の expert になれる日がきっと来るよ！",
            level: .beginner
        ),
        Question(
            text: "Following something in time, or happening later.",
            answer: "After",
            options: [
                WordOption(word: "After", meaning: "〜の後に"),
                WordOption(word: "Alter", meaning: "変える"),
                WordOption(word: "Altar", meaning: "祭壇"),
                WordOption(word: "Alert", meaning: "警告する")
            ],
            hint: "おなじみの「〜の後に」という意味だね。でも、つづりが激似の alter（変える）や altar（祭壇）は、試験で大人の意地悪なひっかけ問題としてよく出るんだ。今ここで見分けておけばもう安心だね！",
            level: .beginner
        ),
        Question(
            text: "A flat object that you open and close to enter a room or building.",
            answer: "Door",
            options: [
                WordOption(word: "Door", meaning: "ドア・扉"),
                WordOption(word: "Floor", meaning: "床"),
                WordOption(word: "Deer", meaning: "シカ"),
                WordOption(word: "Doll", meaning: "人形")
            ],
            hint: "部屋に入るための「ドア」のこと。基本の単語こそ、英語の定義文で読むと新鮮だね。今日も一歩ずつ進もう！",
            level: .beginner
        ),
        Question(
            text: "Something that you hope will happen in the future.",
            answer: "Dream",
            options: [
                WordOption(word: "Dream", meaning: "夢・願望"),
                WordOption(word: "Drum", meaning: "ドラム"),
                WordOption(word: "Drama", meaning: "ドラマ"),
                WordOption(word: "Drink", meaning: "飲み物")
            ],
            hint: "寝ているときに見る「夢」や、将来の「目標」のこと。君の夢を叶えるために、英語はきっと大きな力になるよ！",
            level: .beginner
        ),
        Question(
            text: "The number of years that someone has lived.",
            answer: "Age",
            options: [
                WordOption(word: "Age", meaning: "年齢・時代"),
                WordOption(word: "Agree", meaning: "賛成する"),
                WordOption(word: "Ago", meaning: "〜前に"),
                WordOption(word: "Ache", meaning: "痛む")
            ],
            hint: "「年齢」や「時代」を表す言葉だよ。'New Age'（新時代）なんて言い方もするね。短くて簡単な単語だけど、agree（賛成する）や ago（〜前に）とパッと見で混同しないように、じっくり見て選ぼう！",
            level: .beginner
        ),
        Question(
            text: "To stop doing something or to leave your job.",
            answer: "Quit",
            options: [
                WordOption(word: "Quit", meaning: "辞める・中止する"),
                WordOption(word: "Quiet", meaning: "静かな"),
                WordOption(word: "Quite", meaning: "かなり"),
                WordOption(word: "Quick", meaning: "速い")
            ],
            hint: "仕事や習い事を「辞める」こと。パソコンの終了ボタンでもよく見るね。つづりが似ている quiet（静かな）と間違えないように注意！",
            level: .beginner
        ),
        Question(
            text: "A large area of land that is very dry and has a lot of sand.",
            answer: "Desert",
            options: [
                WordOption(word: "Desert", meaning: "砂漠・見捨てる"),
                WordOption(word: "Dessert", meaning: "デザート"),
                WordOption(word: "Detail", meaning: "詳細"),
                WordOption(word: "Deserve", meaning: "〜に値する")
            ],
            hint: "「砂漠」のことだよ。sが2つの dessert（デザート）と間違えないで。砂(Sand)が1つ(s)だからサバク、と覚えよう！",
            level: .beginner
        ),
        Question(
            text: "A piece of writing or speech that says what someone or something is like.",
            answer: "Description",
            options: [
                WordOption(word: "Description", meaning: "描写・説明"),
                WordOption(word: "Destination", meaning: "目的地"),
                WordOption(word: "Definition", meaning: "定義"),
                WordOption(word: "Decoration", meaning: "装飾")
            ],
            hint: "「描写」や「説明」のこと。以前出た describe（描写する）の名詞形だよ。詳しく伝える力をつけよう！",
            level: .beginner
        ),
        Question(
            text: "Slightly cold, but in a way that feels good.",
            answer: "Cool",
            options: [
                WordOption(word: "Cool", meaning: "涼しい・かっこいい"),
                WordOption(word: "Cold", meaning: "寒い"),
                WordOption(word: "Cook", meaning: "料理する"),
                WordOption(word: "Coal", meaning: "石炭")
            ],
            hint: "「涼しくて気持ちいい」状態のこと。人に対して使うと「かっこいい！」という最高の褒め言葉になるよ！",
            level: .beginner
        ),
        Question(
            text: "Having nothing inside; containing no people or things.",
            answer: "Empty",
            options: [
                WordOption(word: "Empty", meaning: "空の・中身のない"),
                WordOption(word: "Early", meaning: "早い"),
                WordOption(word: "Entry", meaning: "入り口"),
                WordOption(word: "Every", meaning: "すべての")
            ],
            hint: "コップや箱の中に何も入っていない「空（から）」の状態。反対は full（いっぱいの）だね。お腹が empty になったら休憩しよう！",
            level: .beginner
        ),
        Question(
            text: "The power from fuel or electricity used to make machines work.",
            answer: "Energy",
            options: [
                WordOption(word: "Energy", meaning: "エネルギー・活力"),
                WordOption(word: "Engine", meaning: "エンジン"),
                WordOption(word: "Enemy", meaning: "敵"),
                WordOption(word: "Entry", meaning: "入場")
            ],
            hint: "機械を動かす力や、人の「元気・活力」のこと。君が今使っている学習 energy、素晴らしいよ！",
            level: .beginner
        ),
        Question(
            text: "Having no mistakes; right.",
            answer: "Correct",
            options: [
                WordOption(word: "Correct", meaning: "正しい・訂正する"),
                WordOption(word: "Collect", meaning: "集める"),
                WordOption(word: "Connect", meaning: "つなぐ"),
                WordOption(word: "Contact", meaning: "連絡する")
            ],
            hint: "間違いがない「正しい」状態。以前出てきた collect（集める）とLとRの違いだけだから、しっかり見分けよう！",
            level: .beginner
        ),
        Question(
            text: "The son or daughter of your uncle or aunt.",
            answer: "Cousin",
            options: [
                WordOption(word: "Cousin", meaning: "いとこ"),
                WordOption(word: "Counsel", meaning: "相談・助言"),
                WordOption(word: "Curtain", meaning: "カーテン"),
                WordOption(word: "Cuisine", meaning: "料理・献立")
            ],
            hint: "おじさん・おばさんの子供、つまり「いとこ」のこと。家族の話題で欠かせない、親しみやすい言葉だね！",
            level: .beginner
        ),
        Question(
            text: "To change something so that it is no longer open.",
            answer: "Close",
            options: [
                WordOption(word: "Close", meaning: "閉める・閉じる・近い"),
                WordOption(word: "Choose", meaning: "選ぶ"),
                WordOption(word: "Chase", meaning: "追いかける"),
                WordOption(word: "Clone", meaning: "クローン・複製")
            ],
            hint: "ドアや本を「閉める」動作のこと。形容詞で「（距離や関係が）近い」という意味でも本当によく使うよ！",
            level: .beginner
        ),
        Question(
            text: "Not clean; marked with mud or dust.",
            answer: "Dirty",
            options: [
                WordOption(word: "Dirty", meaning: "汚い・不潔な"),
                WordOption(word: "Daily", meaning: "毎日の"),
                WordOption(word: "Duty", meaning: "義務"),
                WordOption(word: "Diary", meaning: "日記")
            ],
            hint: "「汚い」こと。 clean（きれいな）の反対だね。綴りが似ている diary（日記）と間違えないように気をつけて！",
            level: .beginner
        ),
        Question(
            text: "To not like someone or something.",
            answer: "Dislike",
            options: [
                WordOption(word: "Dislike", meaning: "嫌う・嫌い"),
                WordOption(word: "Discuss", meaning: "話し合う"),
                WordOption(word: "Dismiss", meaning: "解散させる"),
                WordOption(word: "Distance", meaning: "距離")
            ],
            hint: "「嫌い」という意味。 like の前に否定の dis- がついた形だよ。SNSの『低評価ボタン』でもおなじみの言葉だね。",
            level: .beginner
        ),
        Question(
            text: "To damage something so badly that it cannot be used or no longer exists.",
            answer: "Destroy",
            options: [
                WordOption(word: "Destroy", meaning: "破壊する"),
                WordOption(word: "Describe", meaning: "描写する"),
                WordOption(word: "Display", meaning: "展示する"),
                WordOption(word: "Disturb", meaning: "邪魔する")
            ],
            hint: "形がなくなるほど「壊す」こと。名詞形は destruction。壊すのは一瞬、作るのには時間がかかる、大切にしたい言葉だね。",
            level: .beginner
        ),
        Question(
            text: "The land along the edge of a sea or ocean.",
            answer: "Coast",
            options: [
                WordOption(word: "Coast", meaning: "海岸・沿岸"),
                WordOption(word: "Coal", meaning: "石炭"),
                WordOption(word: "Cast", meaning: "役を割り当てる"),
                WordOption(word: "Cost", meaning: "費用がかかる")
            ],
            hint: "海に面した陸地である「海岸」のこと。ドライブでおなじみの『コースタル（沿岸の）』はこの言葉の仲間だよ。",
            level: .beginner
        ),
        Question(
            text: "A place where students go to study after high school.",
            answer: "College",
            options: [
                WordOption(word: "College", meaning: "大学・単科大学"),
                WordOption(word: "Village", meaning: "村"),
                WordOption(word: "Cottage", meaning: "コテージ"),
                WordOption(word: "Colleague", meaning: "同僚")
            ],
            hint: "高等教育を受ける「大学」のこと。主に総合大学を指す university よりも、専門的な単科大学や身近なキャンパスを指すことが多いよ。",
            level: .beginner
        ),
        Question(
            text: "A feeling of being relaxed and having no pain or worry.",
            answer: "Comfort",
            options: [
                WordOption(word: "Comfort", meaning: "快適さ・心地よさ・慰め"),
                WordOption(word: "Effort", meaning: "努力"),
                WordOption(word: "Afford", meaning: "余裕がある"),
                WordOption(word: "Confirm", meaning: "確認する")
            ],
            hint: "心や体がホッとする「快適さ」のこと。洋服の『コンフォートシューズ（履き心地の良い靴）』のコンフォートだね！",
            level: .beginner
        ),
        Question(
            text: "To show what you think or feel by using words or actions.",
            answer: "Express",
            options: [
                WordOption(word: "Express", meaning: "表現する・急行の"),
                WordOption(word: "Excite", meaning: "興奮させる"),
                WordOption(word: "Expect", meaning: "期待する"),
                WordOption(word: "Exercise", meaning: "運動・練習")
            ],
            hint: "自分の気持ちを外に「表現する」こと。言葉以外にも、表情や絵で表す時にも使えるよ。急行列車（エクスプレス）も同じ単語だね！",
            level: .beginner
        ),
        Question(
            text: "In a circle or in every direction near a place.",
            answer: "Around",
            options: [
                WordOption(word: "Around", meaning: "周りに・およそ"),
                WordOption(word: "Abound", meaning: "豊富にある"),
                WordOption(word: "Aboard", meaning: "乗って"),
                WordOption(word: "Abroad", meaning: "海外へ")
            ],
            hint: "場所の「周りに」や「およそ」を表す言葉だよ。丸（round）のイメージだね！つづりが似ている abroad（海外へ）や abound（豊富にある）は、上級レベルでもみんなが迷うトラップだから、今パッと見分けられた君は天才だよ！",
            level: .beginner
        ),
        Question(
            text: "To arrange to have a room, a ticket, or a table at a later time.",
            answer: "Book",
            options: [
                WordOption(word: "Book", meaning: "予約する・本"),
                WordOption(word: "Look", meaning: "見る"),
                WordOption(word: "Boot", meaning: "ブーツ・長靴"),
                WordOption(word: "Back", meaning: "後ろ・背中")
            ],
            hint: "名詞の「本」だけじゃなく、動詞で「予約する」という意味があるよ。ホテルの『ブッキング』や、ネット予約の『ダブルブッキング』のブックだね！",
            level: .beginner
        ),
        Question(
            text: "A page or a book that shows the days, weeks, and months of a year.",
            answer: "Calendar",
            options: [
                WordOption(word: "Calendar", meaning: "カレンダー・年中行事表"),
                WordOption(word: "Calculator", meaning: "計算機"),
                WordOption(word: "Colander", meaning: "水切りボウル"),
                WordOption(word: "Cylinder", meaning: "円筒・シリンダー")
            ],
            hint: "日付や曜日を確認する「カレンダー」のこと。予定を立てるワクワク感を思い浮かべて選んでみてね！",
            level: .beginner
        ),
        Question(
            text: "A piece of equipment that you use for taking photographs or making films.",
            answer: "Camera",
            options: [
                WordOption(word: "Camera", meaning: "カメラ"),
                WordOption(word: "Cinema", meaning: "映画館"),
                WordOption(word: "Chimney", meaning: "煙突"),
                WordOption(word: "Cabin", meaning: "小屋・客室")
            ],
            hint: "写真を撮る「カメラ」のこと。ラテン語の「部屋（Chamber）」が語源で、昔の暗箱のような仕組みから名付けられたんだよ。",
            level: .beginner
        ),
        Question(
            text: "The middle point or part of something.",
            answer: "Center",
            options: [
                WordOption(word: "Center", meaning: "中心・真ん中・センター"),
                WordOption(word: "Century", meaning: "世紀・100年間"),
                WordOption(word: "Censor", meaning: "検閲官"),
                WordOption(word: "Cellar", meaning: "地下貯蔵庫")
            ],
            hint: "物事の「中心・真ん中」を表すよ。ショッピングセンターのように、人が多く集まる重要な場所を指すときにもよく使う単語だね！",
            level: .beginner
        ),
        Question(
            text: "A possibility of something happening, especially something good.",
            answer: "Chance",
            options: [
                WordOption(word: "Chance", meaning: "機会・チャンス・偶然"),
                WordOption(word: "Change", meaning: "変える・お釣り"),
                WordOption(word: "Chase", meaning: "追いかける"),
                WordOption(word: "Chain", meaning: "鎖・チェーン")
            ],
            hint: "幸運な「機会（チャンス）」のこと。 'by chance' で「偶然に」という意味でも大活躍する、とても前向きな言葉だよ！",
            level: .beginner
        ),
        Question(
            text: "Having a strong feeling of displeasure because of something bad.",
            answer: "Angry",
            options: [
                WordOption(word: "Angry", meaning: "怒った・腹を立てた"),
                WordOption(word: "Agree", meaning: "賛成する"),
                WordOption(word: "Angle", meaning: "角度"),
                WordOption(word: "Anxious", meaning: "心配して")
            ],
            hint: "嫌なことがあって「怒っている」状態のこと。簡単な単語だけど、パッと見で agree（賛成する）と見間違えると、文章の意味が真逆になっちゃうから注意してね。もし勉強に疲れて angry になりそうな時は、温かいものでも飲んで一息入れよう！",
            level: .beginner
        ),
        Question(
            text: "A part of a tree that grows out from the main trunk.",
            answer: "Branch",
            options: [
                WordOption(word: "Branch", meaning: "枝・支店・部門"),
                WordOption(word: "Bench", meaning: "ベンチ"),
                WordOption(word: "Bunch", meaning: "束・一房"),
                WordOption(word: "Brand", meaning: "ブランド")
            ],
            hint: "木の「枝」のこと。そこから広がって、会社の「支店」や銀行の「支店」という意味でもよく使うよ！",
            level: .beginner
        ),
        Question(
            text: "Giving a lot of light, or shining strongly.",
            answer: "Bright",
            options: [
                WordOption(word: "Bright", meaning: "輝いている・頭が良い"),
                WordOption(word: "Breathe", meaning: "呼吸する"),
                WordOption(word: "Brought", meaning: "持ってきた"),
                WordOption(word: "Flight", meaning: "飛行・便")
            ],
            hint: "光が「まぶしく輝いている」様子。人に対して使うと「頭が良い、前途有望な」というポジティブな褒め言葉になるよ！",
            level: .beginner
        ),
        Question(
            text: "A person whose job is to make houses or buildings.",
            answer: "Builder",
            options: [
                WordOption(word: "Builder", meaning: "建築業者・大工さん"),
                WordOption(word: "Barber", meaning: "理髪師"),
                WordOption(word: "Baker", meaning: "パン職人"),
                WordOption(word: "Banker", meaning: "銀行家")
            ],
            hint: "家などを建てる「建築業者さん」のこと。動詞の build（建てる）に「〜する人（-er）」がついた形だね！",
            level: .beginner
        ),
        Question(
            text: "A person who pays money to get something.",
            answer: "Buyer",
            options: [
                WordOption(word: "Buyer", meaning: "買い手・バイヤー"),
                WordOption(word: "Baker", meaning: "パン職人"),
                WordOption(word: "Barber", meaning: "理髪師"),
                WordOption(word: "Broker", meaning: "仲介人")
            ],
            hint: "ものを買う「買い手」のこと。お店の仕入れ担当者を日本語でも「バイヤー」って言うよね。反対は seller（売り手）だよ！",
            level: .beginner
        ),
        
        Question(
            text: "In the middle of a group of three or more people or things.",
            answer: "Among",
            options: [
                WordOption(word: "Among", meaning: "〜の間に・〜に囲まれて"),
                WordOption(word: "Along", meaning: "〜に沿って"),
                WordOption(word: "Alone", meaning: "ひとりで"),
                WordOption(word: "Amount", meaning: "量")
            ],
            hint: "3つ以上のものや、たくさんの人「の間に（囲まれて）」と言うときに使うよ。2つの間の between とよく比べられるんだ。つづりがそっくりの along（〜に沿って）や alone（ひとりで）との違いに気づけたかな？",
            level: .beginner
        ),
        Question(
            text: "A sign or weapon that is thin and has a sharp point at one end.",
            answer: "Arrow",
            options: [
                WordOption(word: "Arrow", meaning: "矢・矢印"),
                WordOption(word: "Narrow", meaning: "狭い"),
                WordOption(word: "Sorrow", meaning: "悲しみ"),
                WordOption(word: "Borrow", meaning: "借りる")
            ],
            hint: "弓で射る「矢」や、標識の「矢印（アロー）」のことだよ。間違い選択肢の narrow（狭い）や borrow（借りる）は、頭に1文字つくだけで全然違う意味になる、見た目がそっくりな『韻踏み（いんふみ）チーム』なんだ。面白いよね！",
            level: .beginner
        ),
        Question(
            text: "Without any other people with you.",
            answer: "Alone",
            options: [
                WordOption(word: "Alone", meaning: "ひとりで・単独で"),
                WordOption(word: "Along", meaning: "〜に沿って"),
                WordOption(word: "Alive", meaning: "生きている"),
                WordOption(word: "Aloud", meaning: "大声で")
            ],
            hint: "「ひとりぼっち」を表す言葉。でも、このアプリで勉強しているときは、君はひとりじゃないからね！ つづりがそっくりの along（〜に沿って）と間違えないように注意してね。",
            level: .beginner
        ),
        Question(
            text: "A person who creates beautiful things like paintings or music.",
            answer: "Artist",
            options: [
                WordOption(word: "Artist", meaning: "芸術家・画家・アーティスト"),
                WordOption(word: "Actor", meaning: "俳優"),
                WordOption(word: "Author", meaning: "著者"),
                WordOption(word: "Altar", meaning: "祭壇")
            ],
            hint: "絵画や音楽など、美しいものを生み出す「芸術家（アーティスト）」のこと。簡単な単語に見えるけれど、actor（俳優）や、このあと出てくる author（著者）とパッと見で混ざりやすいから気をつけよう！",
            level: .beginner
        ),
        Question(
            text: "A person who helps someone else do a job.",
            answer: "Assistant",
            options: [
                WordOption(word: "Assistant", meaning: "助手・アシスタント"),
                WordOption(word: "Applicant", meaning: "応募者"),
                WordOption(word: "Accountant", meaning: "会計士"),
                WordOption(word: "Attendant", meaning: "係員・接客係")
            ],
            hint: "仕事のサポートをしてくれる「助手（アシスタント）」のこと。動詞の assist（手助けする）に「〜する人（-ant）」がくっついた言葉だよ！",
            level: .beginner
        ),
        Question(
            text: "The part of your body that is opposite to your chest.",
            answer: "Back",
            options: [
                WordOption(word: "Back", meaning: "背中・後ろ"),
                WordOption(word: "Bark", meaning: "ほえる"),
                WordOption(word: "Bank", meaning: "銀行"),
                WordOption(word: "Book", meaning: "本")
            ],
            hint: "体の一部分である「背中」のこと。動詞で「後ろに下がる」や、誰かを「バックアップ（応援）する」という意味でもよく使うよ！",
            level: .beginner
        ),
        Question(
            text: "To hit something or someone many times, like a drum.",
            answer: "Beat",
            options: [
                WordOption(word: "Beat", meaning: "叩く・打ち負かす"),
                WordOption(word: "Bite", meaning: "噛む"),
                WordOption(word: "Belt", meaning: "ベルト"),
                WordOption(word: "Boat", meaning: "ボート"),
            ],
            hint: "ドラムなどを何度も「叩く」動作のこと。音楽の『ビート』もこれだね。試合で相手を「打ち負かす」という意味でも大活躍する単語だよ！",
            level: .beginner
        ),
        Question(
            text: "A small piece of metal or plastic that you wear to show your job or rank.",
            answer: "Badge",
            options: [
                WordOption(word: "Badge", meaning: "バッジ・記章"),
                WordOption(word: "Baggage", meaning: "手荷物"),
                WordOption(word: "Bridge", meaning: "橋"),
                WordOption(word: "Judge", meaning: "裁判官")
            ],
            hint: "スーツや制服につける「バッジ」のこと。自分の立場や所属を示すためのものだよ。日本語と同じ感覚で覚えて大丈夫！",
            level: .beginner
        ),
        Question(
            text: "A group of musicians who play music together.",
            answer: "Band",
            options: [
                WordOption(word: "Band", meaning: "バンド・楽団・ひも"),
                WordOption(word: "Bank", meaning: "銀行"),
                WordOption(word: "Bond", meaning: "絆・ボンド"),
                WordOption(word: "Brand", meaning: "ブランド")
            ],
            hint: "音楽を一緒に演奏する「バンド」のこと！他にも、物を１つに「束ねるゴムひも（ラバーバンド）」という意味もあるんだよ。",
            level: .beginner
        ),
        Question(
            text: "An exciting and sometimes dangerous journey or experience.",
            answer: "Adventure",
            options: [
                WordOption(word: "Adventure", meaning: "冒険"),
                WordOption(word: "Advertise", meaning: "宣伝する"),
                WordOption(word: "Advise", meaning: "助言する"),
                WordOption(word: "Advance", meaning: "前進する")
            ],
            hint: "ハラハラドキドキの「冒険」のこと！RPGの世界だけじゃなく、新しい言葉を学ぶことも立派な adventure だよ！",
            level: .beginner
        ),
        Question(
            text: "To give an answer to a question or a letter.",
            answer: "Reply",
            options: [
                WordOption(word: "Reply", meaning: "返事をする"),
                WordOption(word: "Rely", meaning: "頼る"),
                WordOption(word: "Apply", meaning: "申し込む"),
                WordOption(word: "Supply", meaning: "供給する")
            ],
            hint: "メールやLINEで「返信」すること。answer よりもやり取りのニュアンスが強いよ。こまめな reply は人間関係の基本だね！",
            level: .beginner
        ),
        Question(
            text: "The space or area that is inside a building or room.",
            answer: "Interior",
            options: [
                WordOption(word: "Interior", meaning: "室内の・内部の"),
                WordOption(word: "Inferior", meaning: "劣っている"),
                WordOption(word: "Interval", meaning: "間隔"),
                WordOption(word: "Interview", meaning: "面接")
            ],
            hint: "建物の「内装」のこと。日本語でもインテリアって言うよね。反対は exterior（外装）だよ。お部屋の模様替えを想像して！",
            level: .beginner
        ),
        Question(
            text: "A person who buys things from a shop or business.",
            answer: "Customer",
            options: [
                WordOption(word: "Customer", meaning: "顧客"),
                WordOption(word: "Custom", meaning: "習慣"),
                WordOption(word: "Costume", meaning: "衣装"),
                WordOption(word: "Consumer", meaning: "消費者")
            ],
            hint: "お店でものを買う「お客さん」のこと。日本語でもカスタマーセンターという言葉があるね。応援してるよ！",
            level: .beginner
        ),
        Question(
            text: "To use your teeth to break food so you can eat it.",
            answer: "Bite",
            options: [
                WordOption(word: "Bite", meaning: "噛む・かじる"),
                WordOption(word: "Belt", meaning: "ベルト"),
                WordOption(word: "Boat", meaning: "ボート"),
                WordOption(word: "Beat", meaning: "叩く")
            ],
            hint: "歯を使って食べ物をかじる動作だよ。虫に刺された時にもこの言葉を使うんだ。chew（よく噛む）とセットで覚えよう！",
            level: .beginner
        ),
        Question(
            text: "A person who helps you in a shop.",
            answer: "Clerk",
            options: [
                WordOption(word: "Clerk", meaning: "店員・事務員"),
                WordOption(word: "Clock", meaning: "時計"),
                WordOption(word: "Click", meaning: "クリック"),
                WordOption(word: "Clear", meaning: "透明な")
            ],
            hint: "お店の「店員さん」やオフィスの「事務員さん」のこと。スペルが clock（時計）と似ているから見間違えないようにね。",
            level: .beginner
        ),
        Question(
            text: "To put things into a space so they fit.",
            answer: "Fill",
            options: [
                WordOption(word: "Fill", meaning: "満たす・埋める"),
                WordOption(word: "Fall", meaning: "落ちる"),
                WordOption(word: "Feel", meaning: "感じる"),
                WordOption(word: "Full", meaning: "いっぱいの")
            ],
            hint: "空いているスペースに物を入れて「いっぱいにする」こと。書類に書き込む時も 'Fill out' という表現を使うよ。",
            level: .beginner
        ),
        Question(
            text: "To give money to a person for work they did.",
            answer: "Hire",
            options: [
                WordOption(word: "Hire", meaning: "雇う"),
                WordOption(word: "Here", meaning: "ここ"),
                WordOption(word: "Hair", meaning: "髪"),
                WordOption(word: "Fire", meaning: "火・解雇する")
            ],
            hint: "仕事のために人を「雇う」こと。短期間だけ借りる時にも使うよ。反対の意味の fire（解雇する）と一緒に覚えると便利！",
            level: .beginner
        ),
        Question(
            text: "To go on after you stop for a short time.",
            answer: "Continue",
            options: [
                WordOption(word: "Continue", meaning: "続ける"),
                WordOption(word: "Contain", meaning: "含む"),
                WordOption(word: "Confirm", meaning: "確認する"),
                WordOption(word: "Contact", meaning: "連絡する")
            ],
            hint: "途中でやめずに「継続する」こと。ゲームの「コンティニュー」と同じ意味だよ。毎日コツコツ続けるのが上達の近道だね！",
            level: .beginner
        ),
        Question(
            text: "A thing that we use to do a job, like a hammer.",
            answer: "Tool",
            options: [
                WordOption(word: "Tool", meaning: "道具"),
                WordOption(word: "Tall", meaning: "高い"),
                WordOption(word: "Tell", meaning: "話す"),
                WordOption(word: "Took", meaning: "取った")
            ],
            hint: "仕事をするための「道具・工具」のこと。最近は「便利ツール」のように、ソフトウェアのこともこう呼ぶよ。",
            level: .beginner
        ),
        Question(
            text: "To pick the one you want from a group.",
            answer: "Choose",
            options: [
                WordOption(word: "Choose", meaning: "選ぶ"),
                WordOption(word: "Cheese", meaning: "チーズ"),
                WordOption(word: "Chase", meaning: "追いかける"),
                WordOption(word: "Close", meaning: "閉める")
            ],
            hint: "いくつかある中から「選ぶ」こと。名詞形は choice（選択）になるよ。どれにするか選ぶ時のワクワクを思い出して！",
            level: .beginner
        ),
        Question(
            text: "To think that something is good.",
            answer: "Agree",
            options: [
                WordOption(word: "Agree", meaning: "賛成する・同意する"),
                WordOption(word: "Angry", meaning: "怒った"),
                WordOption(word: "Degree", meaning: "度"),
                WordOption(word: "Age", meaning: "年齢")
            ],
            hint: "相手の意見に対して「私もそう思う！」と「賛成する」こと。反対は disagree と言うよ。",
            level: .beginner
        ),
        Question(
            text: "To make a choice between two or more things.",
            answer: "Decide",
            options: [
                WordOption(word: "Decide", meaning: "決める"),
                WordOption(word: "Divide", meaning: "分ける"),
                WordOption(word: "Device", meaning: "装置"),
                WordOption(word: "Describe", meaning: "説明する")
            ],
            hint: "「これにする！」と心を決めること。迷ったあとに決断する情景を浮かべてね。",
            level: .beginner
        ),
        Question(
            text: "To get better, or to make something better.",
            answer: "Improve",
            options: [
                WordOption(word: "Improve", meaning: "改善する"),
                WordOption(word: "Approve", meaning: "承認する"),
                WordOption(word: "Impress", meaning: "感動させる"),
                WordOption(word: "Import", meaning: "輸入する")
            ],
            hint: "質を高めたり、向上させたりすること。今の君の英語学習も、毎日少しずつ improve しているよ！",
            level: .beginner
        ),
        Question(
            text: "Something that you must do because it is your job.",
            answer: "Duty",
            options: [
                WordOption(word: "Duty", meaning: "義務"),
                WordOption(word: "Daily", meaning: "毎日の"),
                WordOption(word: "Dirty", meaning: "汚い"),
                WordOption(word: "Data", meaning: "資料")
            ],
            hint: "仕事や立場上やらなきゃいけない「義務」のこと。空港の duty-free（免税）は税金を払う義務がないってことだよ。",
            level: .beginner
        ),
        Question(
            text: "A feeling of being happy and satisfied.",
            answer: "Pleasure",
            options: [
                WordOption(word: "Pleasure", meaning: "喜び"),
                WordOption(word: "Pressure", meaning: "圧力"),
                WordOption(word: "Measure", meaning: "測定"),
                WordOption(word: "Precious", meaning: "貴重な")
            ],
            hint: "「喜び」や「楽しみ」を表す素敵な言葉。お礼を言われた時に 'My pleasure.'（どういたしまして）と返せるとかっこいいね。",
            level: .beginner
        ),
        Question(
            text: "To stop something from burning.",
            answer: "Extinguish",
            options: [
                WordOption(word: "Extinguish", meaning: "（火を）消す"),
                WordOption(word: "Distinguish", meaning: "区別する"),
                WordOption(word: "Establish", meaning: "設立する"),
                WordOption(word: "Finish", meaning: "終わらせる")
            ],
            hint: "燃えている火を「消す」という少し難しい単語。でも消火器は fire extinguisher と言うんだ。綴りが似ている distinguish（区別する）と間違えないようにね！",
            level: .beginner
        ),
        Question(
            text: "A person who performs in films, plays, or television shows.",
            answer: "Actor",
            options: [
                WordOption(word: "Actor", meaning: "俳優・男優"),
                WordOption(word: "Author", meaning: "著者・作家"),
                WordOption(word: "Anchor", meaning: "ニュースキャスター"),
                WordOption(word: "Factor", meaning: "要因・要素")
            ],
            hint: "映画やドラマで演技をする「俳優さん」のこと。act（行動する・演じる）に「〜する人（-or）」がくっついた言葉だよ。女性の場合は actress と言うことも合わせて覚えておこう！",
            level: .beginner
        ),
        Question(
            text: "To join two or more things together.",
            answer: "Connect",
            options: [
                WordOption(word: "Connect", meaning: "つなぐ・接続する"),
                WordOption(word: "Collect", meaning: "集める"),
                WordOption(word: "Correct", meaning: "正しい"),
                WordOption(word: "Contact", meaning: "連絡をとる")
            ],
            hint: "2つ以上のものを「つなぐ」こと。Wi-Fi接続の『コネクト』だね。カチッとつながるイメージだよ！",
            level: .beginner
        ),
        Question(
            text: "To communicate with someone, often by phone or email.",
            answer: "Contact",
            options: [
                WordOption(word: "Contact", meaning: "連絡をとる・接触"),
                WordOption(word: "Contract", meaning: "契約"),
                WordOption(word: "Contrast", meaning: "対比"),
                WordOption(word: "Connect", meaning: "つなぐ")
            ],
            hint: "誰かに「連絡をとる」こと。日本語でもコンタクトをとるって言うよね。相手に近づく情景だよ！",
            level: .beginner
        ),
        Question(
            text: "To change something so that it is no longer open.",
            answer: "Close",
            options: [
                WordOption(word: "Close", meaning: "閉める・閉じる・近い"),
                WordOption(word: "Choose", meaning: "選ぶ"),
                WordOption(word: "Chase", meaning: "追いかける"),
                WordOption(word: "Clone", meaning: "クローン・複製")
            ],
            hint: "ドアや本を「閉める」動作のこと。形容詞で「（距離や関係が）近い」という意味でも本当によく使うよ！",
            level: .beginner
        ),
        Question(
            text: "The land along the edge of a sea or ocean.",
            answer: "Coast",
            options: [
                WordOption(word: "Coast", meaning: "海岸・沿岸"),
                WordOption(word: "Coal", meaning: "石炭"),
                WordOption(word: "Cast", meaning: "役を割り当てる"),
                WordOption(word: "Cost", meaning: "費用がかかる")
            ],
            hint: "海に面した陸地である「海岸」のこと。ドライブでおなじみの『コースタル（沿岸の）』はこの言葉の仲間だよ。",
            level: .beginner
        ),
        Question(
            text: "A place where students go to study after high school.",
            answer: "College",
            options: [
                WordOption(word: "College", meaning: "大学・単科大学"),
                WordOption(word: "Village", meaning: "村"),
                WordOption(word: "Cottage", meaning: "コテージ"),
                WordOption(word: "Colleague", meaning: "同僚")
            ],
            hint: "高等教育を受ける「大学」のこと。主に総合大学を指す university よりも、専門的な単科大学や身近なキャンパスを指すことが多いよ。",
            level: .beginner
        ),
        Question(
            text: "A feeling of being relaxed and having no pain or worry.",
            answer: "Comfort",
            options: [
                WordOption(word: "Comfort", meaning: "快適さ・心地よさ・慰め"),
                WordOption(word: "Effort", meaning: "努力"),
                WordOption(word: "Afford", meaning: "余裕がある"),
                WordOption(word: "Confirm", meaning: "確認する")
            ],
            hint: "心や体がホッとする「快適さ」のこと。洋服の『コンフォートシューズ（履き心地の良い靴）』のコンフォートだね！",
            level: .beginner
        ),
        Question(
            text: "Always moving around and doing a lot of things.",
            answer: "Active",
            options: [
                WordOption(word: "Active", meaning: "活動的な・積極的な"),
                WordOption(word: "Actual", meaning: "実際の"),
                WordOption(word: "Action", meaning: "行動"),
                WordOption(word: "Attractive", meaning: "魅力的な")
            ],
            hint: "いつも元気いっぱいで「活動的な」様子を表すよ。日本語でも『アクティブな人』って言うよね。反対は passive（消極的な）。今の君の勉強スタイルも、とっても active で素敵だよ！",
            level: .beginner
        ),
        Question(
            text: "In or to a foreign country.",
            answer: "Abroad",
            options: [
                WordOption(word: "Abroad", meaning: "海外へ・外国で"),
                WordOption(word: "Aboard", meaning: "（船や飛行機に）乗って"),
                WordOption(word: "Broad", meaning: "広い"),
                WordOption(word: "Ahead", meaning: "前方に")
            ],
            hint: "「海外へ」という意味の副詞だよ。go abroad で『海外に行く』。綴りが激似の aboard（乗って）は、入試やTOEICで日本人が一番引っかかる大好物トラップだから、今ここで見分けてドヤ顔しちゃおう！",
            level: .beginner
        ),
        Question(
            text: "A piece of clothing that covers the top of the body and hangs down over the legs.",
            answer: "Dress",
            options: [
                WordOption(word: "Dress", meaning: "ドレス・ワンピース・服を着る"),
                WordOption(word: "Drink", meaning: "飲む"),
                WordOption(word: "Dream", meaning: "夢"),
                WordOption(word: "Door", meaning: "ドア")
            ],
            hint: "上下がつながった「ドレス」や「ワンピース」のこと。動詞で「服を着る」という意味でもよく使うよ！",
            level: .beginner
        ),
        Question(
            text: "To take liquid into your mouth and swallow it.",
            answer: "Drink",
            options: [
                WordOption(word: "Drink", meaning: "飲む・飲み物"),
                WordOption(word: "Drive", meaning: "運転する"),
                WordOption(word: "Draw", meaning: "描く"),
                WordOption(word: "Dread", meaning: "ひどく恐れる")
            ],
            hint: "飲み物を「飲む」動作のこと。名詞で「飲み物」そのものを指すこともあるよ。しっかり水分を摂ってリフレッシュしてね！",
            level: .beginner
        ),
        Question(
            text: "Not wet, or without water or moisture.",
            answer: "Dry",
            options: [
                WordOption(word: "Dry", meaning: "乾いた・乾かす"),
                WordOption(word: "Day", meaning: "日"),
                WordOption(word: "Die", meaning: "死ぬ"),
                WordOption(word: "Cry", meaning: "泣く")
            ],
            hint: "水気がなくて「乾いた」状態。反対の意味は wet だね。綴りが1文字違うだけの die や cry と見分けられたかな？",
            level: .beginner
        ),
        Question(
            text: "To move something using a machine with wheels, like a car.",
            answer: "Drive",
            options: [
                WordOption(word: "Drive", meaning: "運転する"),
                WordOption(word: "Drink", meaning: "飲む"),
                WordOption(word: "Dress", meaning: "服を着る"),
                WordOption(word: "Dream", meaning: "夢を見る")
            ],
            hint: "車やバスを「運転する」こと。自分でハンドルを握って進む情景を浮かべてね。安全運転で行こう！",
            level: .beginner
        ),
        Question(
            text: "A person who teaches students at a school.",
            answer: "Teacher",
            options: [
                WordOption(word: "Teacher", meaning: "先生"),
                WordOption(word: "Trainer", meaning: "訓練士"),
                WordOption(word: "Thinker", meaning: "思想家"),
                WordOption(word: "Traveler", meaning: "旅行者")
            ],
            hint: "学校で勉強を教えてくれる「先生」のこと。teach（教える）に -er（人）がついた言葉だよ。",
            level: .beginner
        ),
        Question(
            text: "A place where you can see films on a big screen.",
            answer: "Cinema",
            options: [
                WordOption(word: "Cinema", meaning: "映画館"),
                WordOption(word: "Camera", meaning: "カメラ"),
                WordOption(word: "Center", meaning: "中心"),
                WordOption(word: "Circle", meaning: "円")
            ],
            hint: "大きな画面で映画を楽しむ「映画館」のこと。movie theater とも言うけれど、イギリス英語では cinema がよく使われるよ。",
            level: .beginner
        ),
        Question(
            text: "To put your name on a paper to show you agree.",
            answer: "Sign",
            options: [
                WordOption(word: "Sign", meaning: "署名する"),
                WordOption(word: "Sing", meaning: "歌う"),
                WordOption(word: "Sink", meaning: "沈む"),
                WordOption(word: "Side", meaning: "側")
            ],
            hint: "書類などに名前を「書く（署名する）」こと。また、街中の「看板」や「合図」という意味もあるよ。",
            level: .beginner
        ),
        Question(
            text: "A person who flies a plane.",
            answer: "Pilot",
            options: [
                WordOption(word: "Pilot", meaning: "パイロット"),
                WordOption(word: "Pianist", meaning: "ピアニスト"),
                WordOption(word: "Painter", meaning: "画家"),
                WordOption(word: "Police", meaning: "警察")
            ],
            hint: "飛行機を操縦する「パイロット」のこと。大空を飛ぶかっこいい仕事だね！",
            level: .beginner
        ),
        Question(
            text: "To use a needle and thread to make or fix clothes.",
            answer: "Sew",
            options: [
                WordOption(word: "Sew", meaning: "縫う"),
                WordOption(word: "Saw", meaning: "見た（seeの過去形）"),
                WordOption(word: "Sea", meaning: "海"),
                WordOption(word: "Sow", meaning: "種をまく")
            ],
            hint: "針と糸を使って服を「縫う」こと。発音は「ソウ」だよ。お気に入りの服を直す時に使う言葉だね。",
            level: .beginner
        ),
        Question(
            text: "A place where you can keep your money safe.",
            answer: "Bank",
            options: [
                WordOption(word: "Bank", meaning: "銀行"),
                WordOption(word: "Back", meaning: "後ろ"),
                WordOption(word: "Band", meaning: "バンド"),
                WordOption(word: "Book", meaning: "本")
            ],
            hint: "お金を預けたり引き出したりする「銀行」のこと。川の「堤防・土手」という意味もあるんだよ。",
            level: .beginner
        ),
        Question(
            text: "To say that you are sorry for something you did wrong.",
            answer: "Apologize",
            options: [
                WordOption(word: "Apologize", meaning: "謝罪する"),
                WordOption(word: "Analyze", meaning: "分析する"),
                WordOption(word: "Advertise", meaning: "宣伝する"),
                WordOption(word: "Recognize", meaning: "認める")
            ],
            hint: "「ごめんなさい」と謝ること。素直に謝れる人は素敵だよね。名詞の apology（謝罪）もセットで覚えておこう！",
            level: .beginner
        ),
        Question(
            text: "To pick up and take someone or something to another place.",
            answer: "Collect",
            options: [
                WordOption(word: "Collect", meaning: "集める・回収する"),
                WordOption(word: "Correct", meaning: "正しい・訂正する"),
                WordOption(word: "Connect", meaning: "つなぐ"),
                WordOption(word: "Select", meaning: "選ぶ")
            ],
            hint: "バラバラなものを「集める」こと。ゴミの回収や、趣味のコレクションもこれ！LとRの区別が難しい correct（正しい）とセットで気をつけて！",
            level: .beginner
        ),
        Question(
            text: "A person who works at a desk in a hotel or office building.",
            answer: "Receptionist",
            options: [
                WordOption(word: "Receptionist", meaning: "受付係"),
                WordOption(word: "Pharmacist", meaning: "薬剤師"),
                WordOption(word: "Specialist", meaning: "専門家"),
                WordOption(word: "Journalist", meaning: "記者")
            ],
            hint: "ホテルのフロントなどで最初に応対してくれる「受付さん」のこと。receive（受け取る）人、と覚えるとスペルも怖くないよ！",
            level: .beginner
        ),
        Question(
            text: "To think that something is true, although you are not sure.",
            answer: "Guess",
            options: [
                WordOption(word: "Guess", meaning: "推測する"),
                WordOption(word: "Guest", meaning: "来客"),
                WordOption(word: "Guide", meaning: "案内する"),
                WordOption(word: "Guard", meaning: "守る")
            ],
            hint: "「たぶんこうかな？」と予想すること。'Guess what?'（ねえ聞いて！）は会話のきっかけに超便利なフレーズだよ！",
            level: .beginner
        ),
        Question(
            text: "To keep someone or something safe from danger or harm.",
            answer: "Protect",
            options: [
                WordOption(word: "Protect", meaning: "守る・保護する"),
                WordOption(word: "Project", meaning: "計画・事業"),
                WordOption(word: "Product", meaning: "製品"),
                WordOption(word: "Predict", meaning: "予測する")
            ],
            hint: "大切なものを「守る」こと。パスワードや環境を守る時にも使うよ。スマホの画面を守る「プロテクター」もこの仲間だね！",
            level: .beginner
        ),
        Question(
            text: "A building where people go to see interesting and old things.",
            answer: "Museum",
            options: [
                WordOption(word: "Museum", meaning: "博物館・美術館"),
                WordOption(word: "Stadium", meaning: "競技場"),
                WordOption(word: "Medium", meaning: "媒体・中間の"),
                WordOption(word: "Premium", meaning: "高級な・保険料")
            ],
            hint: "歴史的なものやアートが並ぶ「博物館」や「美術館」のこと。似た終わりの単語が多いから、建物のイメージと一緒に覚えよう！",
            level: .beginner
        ),
        Question(
            text: "To ask someone to come to a party or an event.",
            answer: "Invite",
            options: [
                WordOption(word: "Invite", meaning: "招待する"),
                WordOption(word: "Invent", meaning: "発明する"),
                WordOption(word: "Invest", meaning: "投資する"),
                WordOption(word: "Indicate", meaning: "示す")
            ],
            hint: "誰かをパーティーなどに「招待する」こと。招待状は invitation。似ている invent（発明する）と間違えないようにパーティーを想像してみて！",
            level: .beginner
        ),
        Question(
            text: "To tell someone that you will definitely do something.",
            answer: "Promise",
            options: [
                WordOption(word: "Promise", meaning: "約束する"),
                WordOption(word: "Promote", meaning: "促進する"),
                WordOption(word: "Provide", meaning: "提供する"),
                WordOption(word: "Propose", meaning: "提案する")
            ],
            hint: "「絶対にやるよ」と「約束する」こと。名詞でも promise（約束）。自分自身との promise も大切にしていきたいよね！",
            level: .beginner
        ),
        Question(
            text: "To move your body to the sound of music.",
            answer: "Dance",
            options: [
                WordOption(word: "Dance", meaning: "踊る"),
                WordOption(word: "Chance", meaning: "機会"),
                WordOption(word: "Glance", meaning: "ちらりと見る"),
                WordOption(word: "Advance", meaning: "進歩する")
            ],
            hint: "音楽に合わせて体を動かして「踊る」こと。簡単な単語だけど、chance（チャンス）などの似た音の単語に惑わされないようにね！",
            level: .beginner
        ),
        Question(
            text: "The person who lives next to you or near you.",
            answer: "Neighbor",
            options: [
                WordOption(word: "Neighbor", meaning: "隣人・近所の人"),
                WordOption(word: "Nephew", meaning: "甥"),
                WordOption(word: "Neither", meaning: "どちらも〜ない"),
                WordOption(word: "Network", meaning: "網・人脈")
            ],
            hint: "お隣さんや近所に住む「隣人」のこと。綴りは少し長いけど、neighborhood（近所・地域）という言葉もよく使うから一緒に覚えてね！",
            level: .beginner
        ),
        Question(
            text: "A person who is traveling for pleasure.",
            answer: "Traveler",
            options: [
                WordOption(word: "Traveler", meaning: "旅行者"),
                WordOption(word: "Trainer", meaning: "訓練士"),
                WordOption(word: "Traitor", meaning: "裏切り者"),
                WordOption(word: "Transfer", meaning: "乗り換え")
            ],
            hint: "楽しみのために旅をする「旅行者」のこと。travel（旅行する）に「〜する人」を意味する -er がついた形だね。いつか海外へ飛び出そう！",
            level: .beginner
        ),
        Question(
            text: "To think about something carefully before making a choice.",
            answer: "Consider",
            options: [
                WordOption(word: "Consider", meaning: "よく考える・検討する"),
                WordOption(word: "Consist", meaning: "成り立つ"),
                WordOption(word: "Contain", meaning: "含む"),
                WordOption(word: "Continue", meaning: "続ける")
            ],
            hint: "何かを決める前に「よく考える」こと。相手の気持ちを考える（思いやる）時にも使う、とても温かくて深い言葉なんだ。",
            level: .beginner
        ),
        Question(
            text: "To make something ready for use or for a particular purpose.",
            answer: "Prepare",
            options: [
                WordOption(word: "Prepare", meaning: "準備する"),
                WordOption(word: "Compare", meaning: "比較する"),
                WordOption(word: "Repair", meaning: "修理する"),
                WordOption(word: "Declare", meaning: "宣言する")
            ],
            hint: "テストの前や、料理の前に「準備する」こと。'Be prepared'（備えよ常に）という有名なフレーズもあるよ。準備万端で挑もう！",
            level: .beginner
        ),
        Question(
            text: "To look at words and understand them.",
            answer: "Read",
            options: [
                WordOption(word: "Read", meaning: "読む"),
                WordOption(word: "Road", meaning: "道"),
                WordOption(word: "Rice", meaning: "米"),
                WordOption(word: "Ride", meaning: "乗る")
            ],
            hint: "本やメールを「読む」こと。今、君がこの文を「読んでいる」のも read だね！",
            level: .beginner
        ),
        Question(
            text: "A person who is traveling in a vehicle but not driving it.",
            answer: "Passenger",
            options: [
                WordOption(word: "Passenger", meaning: "乗客"),
                WordOption(word: "Messenger", meaning: "伝言を運ぶ人"),
                WordOption(word: "Passage", meaning: "通路・一節"),
                WordOption(word: "Pioneer", meaning: "先駆者")
            ],
            hint: "電車や飛行機に乗っている「お客さん」のこと。pass（通り過ぎる）する人、というイメージだね。旅行気分で覚えてみて！",
            level: .beginner
        ),
        Question(
            text: "To change or correct a piece of writing, a film, or data.",
            answer: "Edit",
            options: [
                WordOption(word: "Edit", meaning: "編集する・修正する"),
                WordOption(word: "Exit", meaning: "出口・去る"),
                WordOption(word: "Emit", meaning: "出す・放つ"),
                WordOption(word: "Eat", meaning: "食べる")
            ],
            hint: "文章や動画を「編集する」こと。SNSの投稿を直すときにも使う、身近で大切な言葉だね！",
            level: .beginner
        ),
        Question(
            text: "The physical or mental strength that you use to do something.",
            answer: "Effort",
            options: [
                WordOption(word: "Effort", meaning: "努力・尽力"),
                WordOption(word: "Effect", meaning: "効果・影響"),
                WordOption(word: "Afford", meaning: "余裕がある"),
                WordOption(word: "Comfort", meaning: "快適さ")
            ],
            hint: "何かを成し遂げるための「努力」のこと。君が今この問題を解いている effort、ちゃんと積み重なっているよ！",
            level: .beginner
        ),
        Question(
            text: "To say something is not true or to say no to something.",
            answer: "Refuse",
            options: [
                WordOption(word: "Refuse", meaning: "断る"),
                WordOption(word: "Reuse", meaning: "再利用する"),
                WordOption(word: "Reduce", meaning: "減らす"),
                WordOption(word: "Confuse", meaning: "混乱させる")
            ],
            hint: "何かを「断る」とか、拒否すること。強い意志を持って「ノー」と言う情景だよ。reuse（再利用）と形が似ているから見間違えないでね。",
            level: .beginner
        ),
        Question(
            text: "To take air into your body and let it out again.",
            answer: "Breathe",
            options: [
                WordOption(word: "Breathe", meaning: "呼吸する"),
                WordOption(word: "Bright", meaning: "明るい"),
                WordOption(word: "Break", meaning: "壊す・休憩"),
                WordOption(word: "Bridge", meaning: "橋")
            ],
            hint: "空気を吸って吐く「呼吸する」という動作だよ。eがない breath は「息（名詞）」になるんだ。深呼吸してリラックスしよう！",
            level: .beginner
        ),
        Question(
            text: "To look for something that is lost or hidden.",
            answer: "Search",
            options: [
                WordOption(word: "Search", meaning: "探す"),
                WordOption(word: "Research", meaning: "研究する"),
                WordOption(word: "Speech", meaning: "演説"),
                WordOption(word: "Switch", meaning: "切り替える")
            ],
            hint: "失くしたものや情報を「探す」こと。ネットで検索するのも search だね。見つかった時のスッキリ感を想像して解いてみて！",
            level: .beginner
        ),
        Question(
            text: "To give an answer to a question or a letter.",
            answer: "Reply",
            options: [
                WordOption(word: "Reply", meaning: "返事をする"),
                WordOption(word: "Rely", meaning: "頼る"),
                WordOption(word: "Apply", meaning: "申し込む"),
                WordOption(word: "Supply", meaning: "供給する")
            ],
            hint: "メールやLINEで「返信」すること。answer よりもやり取りのニュアンスが強いよ。こまめな reply は人間関係の基本だね！",
            level: .beginner
        ),
        Question(
            text: "To use a pen or pencil to make words on paper.",
            answer: "Write",
            options: [
                WordOption(word: "Write", meaning: "書く"),
                WordOption(word: "Right", meaning: "正しい・右"),
                WordOption(word: "White", meaning: "白い"),
                WordOption(word: "Light", meaning: "軽い・光")
            ],
            hint: "文字を「書く」ことだね。発音が同じ right（正しい）や、綴りが似ている white（白い）と間違えないように。基本を大切にしていこう！",
            level: .beginner
        ),
        Question(
            text: "To stay away from someone or something.",
            answer: "Avoid",
            options: [
                WordOption(word: "Avoid", meaning: "避ける"),
                WordOption(word: "Afford", meaning: "余裕がある"),
                WordOption(word: "Award", meaning: "賞"),
                WordOption(word: "Admit", meaning: "認める")
            ],
            hint: "嫌なことや危ないことを「避ける」こと。混んでいる場所を avoid して、ゆっくり学習しよう。綴りが似ている afford と間違えないようにね！",
            level: .beginner
        ),
        Question(
            text: "To give someone a job in your company or to pay them to work for you.",
            answer: "Employ",
            options: [
                WordOption(word: "Employ", meaning: "雇う"),
                WordOption(word: "Explore", meaning: "探検する"),
                WordOption(word: "Explain", meaning: "説明する"),
                WordOption(word: "Export", meaning: "輸出する")
            ],
            hint: "会社が人を「雇う」こと。名詞の employee（従業員）はここから来ているんだ。似た形の explore（探検）と間違えないでね！",
            level: .beginner
        ),
        Question(
            text: "To talk to someone to exchange ideas or information.",
            answer: "Discuss",
            options: [
                WordOption(word: "Discuss", meaning: "話し合う・議論する"),
                WordOption(word: "Dismiss", meaning: "解散させる"),
                WordOption(word: "Discover", meaning: "発見する"),
                WordOption(word: "Dislike", meaning: "嫌う")
            ],
            hint: "みんなで意見を出し合って「話し合う」こと。単なるおしゃべりより、少し真面目な相談という感じだね。名詞は discussion だよ。",
            level: .beginner
        ),
        Question(
            text: "How much of something there is, or the total money you have.",
            answer: "Amount",
            options: [
                WordOption(word: "Amount", meaning: "量・金額"),
                WordOption(word: "Account", meaning: "口座・説明"),
                WordOption(word: "Around", meaning: "周りに"),
                WordOption(word: "Among", meaning: "〜の間で")
            ],
            hint: "「量」や「総計」のこと。お金の「金額」を指すときにもよく使われるよ。見た目が似ている Account（口座）と間違えないようにね！",
            level: .beginner
        ),
        Question(
            text: "A piece of writing in a newspaper or a magazine.",
            answer: "Article",
            options: [
                WordOption(word: "Article", meaning: "記事"),
                WordOption(word: "Artist", meaning: "芸術家"),
                WordOption(word: "Active", meaning: "活動的な"),
                WordOption(word: "Advice", meaning: "助言")
            ],
            hint: "新聞や雑誌の「記事」のこと。冠詞（a, an, the）という意味もあるけど、まずは「読み物」として覚えよう。毎日ひとつ記事を読む習慣、素敵だね！",
            level: .beginner
        ),
        Question(
            text: "The bags and suitcases you take when you travel.",
            answer: "Baggage",
            options: [
                WordOption(word: "Baggage", meaning: "手荷物"),
                WordOption(word: "Package", meaning: "小包"),
                WordOption(word: "Garage", meaning: "車庫"),
                WordOption(word: "Cabbage", meaning: "キャベツ")
            ],
            hint: "旅行の時の「手荷物」のこと。luggage とも言うよ。空港で自分のバッグが出てくるのを待つ時のあのワクワク感を思い出して！",
            level: .beginner
        ),
        Question(
            text: "A structure built over a river or a road so people can cross it.",
            answer: "Bridge",
            options: [
                WordOption(word: "Bridge", meaning: "橋"),
                WordOption(word: "Bright", meaning: "明るい"),
                WordOption(word: "Branch", meaning: "支店・枝"),
                WordOption(word: "Breeze", meaning: "そよ風")
            ],
            hint: "川や道にかかる「橋」のこと。人と人をつなぐ架け橋、なんて言い方もするね。スペルが似ている Bright（明るい）と混ざらないように注意！",
            level: .beginner
        ),
        Question(
            text: "The amount of money you can spend on something.",
            answer: "Budget",
            options: [
                WordOption(word: "Budget", meaning: "予算"),
                WordOption(word: "Bucket", meaning: "バケツ"),
                WordOption(word: "Bridge", meaning: "橋"),
                WordOption(word: "Badge", meaning: "バッジ")
            ],
            hint: "「予算」のこと。計画的にお金を使うための大事な数字だね。バケツ（bucket）と音が少し似ているけど、中に入れるのは水じゃなくてお金だよ。",
            level: .beginner
        ),
        Question(
            text: "The amount of money you need to buy or do something.",
            answer: "Cost",
            options: [
                WordOption(word: "Cost", meaning: "費用"),
                WordOption(word: "Cast", meaning: "投げる・配役"),
                WordOption(word: "Coast", meaning: "海岸"),
                WordOption(word: "Case", meaning: "場合")
            ],
            hint: "「費用」や「代金」のこと。動詞で「〜の費用がかかる」という意味でも使うよ。Coast（海岸）とスペルが似ているから、海に行かないように気をつけて！",
            level: .beginner
        ),
        Question(
            text: "A small piece of paper that gives you a cheaper price.",
            answer: "Coupon",
            options: [
                WordOption(word: "Coupon", meaning: "クーポン"),
                WordOption(word: "Common", meaning: "共通の"),
                WordOption(word: "Cousin", meaning: "いとこ"),
                WordOption(word: "Column", meaning: "コラム")
            ],
            hint: "日本語でもおなじみの「クーポン」。割引券のことだね。海外でも 'Use a coupon' で通じるよ。ちょっと得した気分になれる魔法の紙だね！",
            level: .beginner
        ),
        Question(
            text: "An electronic machine that can store andワーク with a lot of information.",
            answer: "Computer",
            options: [
                WordOption(word: "Computer", meaning: "コンピューター"),
                WordOption(word: "Calculator", meaning: "計算機"),
                WordOption(word: "Conductor", meaning: "指揮者・車掌"),
                WordOption(word: "Commuter", meaning: "通勤者")
            ],
            hint: "情報を処理する「コンピューター」のこと。語源の compute は「計算する」という意味。今君がアプリを使っている画面の向こうでも大活躍しているよ！",
            level: .beginner
        ),
        Question(
            text: "Happening often or found in many places, so it is not special.",
            answer: "Common",
            options: [
                WordOption(word: "Common", meaning: "共通の・一般的な・よくある"),
                WordOption(word: "Comment", meaning: "批評・コメント"),
                WordOption(word: "Command", meaning: "命令する"),
                WordOption(word: "Comfort", meaning: "快適さ")
            ],
            hint: "どこにでもあって「一般的な、よくある」こと。 'common sense' で「常識（みんなが持つ共通の感覚）」という意味でもよく使うよ！",
            level: .beginner
        ),
        Question(
            text: "A situation where something happens later than planned.",
            answer: "Delay",
            options: [
                WordOption(word: "Delay", meaning: "遅延"),
                WordOption(word: "Daily", meaning: "毎日の"),
                WordOption(word: "Display", meaning: "展示"),
                WordOption(word: "Decay", meaning: "腐敗")
            ],
            hint: "予定より「遅れる」こと。飛行機や電車が遅れたときによく聞く言葉だね。毎日（daily）の学習は、delay させずにコツコツ続けよう！",
            level: .beginner
        ),
        Question(
            text: "Physical harm to something so that it is broken.",
            answer: "Damage",
            options: [
                WordOption(word: "Damage", meaning: "損害"),
                WordOption(word: "Manage", meaning: "管理する"),
                WordOption(word: "Message", meaning: "伝言"),
                WordOption(word: "Storage", meaning: "保管")
            ],
            hint: "物に対する「損害」や「痛み」のこと。ゲームでもおなじみの言葉だね。Manage（管理する）と語尾が似ているけど、意味は全然違うから気をつけて！",
            level: .beginner
        ),
        Question(
            text: "A lower price than usual for something.",
            answer: "Discount",
            options: [
                WordOption(word: "Discount", meaning: "割引"),
                WordOption(word: "Distance", meaning: "距離"),
                WordOption(word: "Distinct", meaning: "はっきりした"),
                WordOption(word: "Discover", meaning: "発見する")
            ],
            hint: "「割引」のこと。Dis（下げる）+ Count（数える）で安くするというイメージだね。お店でこれを見つけると、つい足が止まっちゃうよね。",
            level: .beginner
        ),
        Question(
            text: "A door or a way to go out of a building.",
            answer: "Exit",
            options: [
                WordOption(word: "Exit", meaning: "出口"),
                WordOption(word: "Edit", meaning: "編集する"),
                WordOption(word: "Exist", meaning: "存在する"),
                WordOption(word: "Excite", meaning: "興奮させる")
            ],
            hint: "「出口」のこと。反対は Entrance（入り口）だよ。綴りが似ている Exist（存在する）と間違えないように。君の出口はこっちだよ！",
            level: .beginner
        ),
        Question(
            text: "The act of coming into a place or joining a competition.",
            answer: "Entry",
            options: [
                WordOption(word: "Entry", meaning: "入り口・参加"),
                WordOption(word: "Empty", meaning: "空の"),
                WordOption(word: "Entire", meaning: "全体の"),
                WordOption(word: "Energy", meaning: "エネルギー")
            ],
            hint: "「入り口」や「参加」のこと。コンテストに応募するのも Entry と言うよ。君がこのアプリを始めたことも、立派な英語への Entry だね！",
            level: .beginner
        ),
        Question(
            text: "Things like tables, chairs, and beds in a room.",
            answer: "Furniture",
            options: [
                WordOption(word: "Furniture", meaning: "家具"),
                WordOption(word: "Future", meaning: "未来"),
                WordOption(word: "Fortune", meaning: "運勢"),
                WordOption(word: "Feature", meaning: "特徴")
            ],
            hint: "椅子や机などの「家具」の総称だよ。数えられない名詞なので a furniture とは言わないのがポイント。Future（未来）と見間違えないで！",
            level: .beginner
        ),
        Question(
            text: "Food and other things that you buy at a supermarket.",
            answer: "Grocery",
            options: [
                WordOption(word: "Grocery", meaning: "食料雑貨"),
                WordOption(word: "Glory", meaning: "栄光"),
                WordOption(word: "Gallery", meaning: "画廊"),
                WordOption(word: "Greedy", meaning: "欲張りな")
            ],
            hint: "スーパーで買うような「食料雑貨」のこと。お買い物に行くことを 'Go grocery shopping' と言うよ。毎日の生活に欠かせない言葉だね！",
            level: .beginner
        ),
        Question(
            text: "The information and understanding that you have in your mind.",
            answer: "Knowledge",
            options: [
                WordOption(word: "Knowledge", meaning: "知識"),
                WordOption(word: "Knowledgeable", meaning: "物知りな"),
                WordOption(word: "Language", meaning: "言語"),
                WordOption(word: "College", meaning: "大学")
            ],
            hint: "「知識」のこと。Know（知っている）の名詞形だよ。Kは発音しないから「ナレッジ」と読もう。君の努力がどんどん知識に変わっていくよ！",
            level: .beginner
        ),
        Question(
            text: "Information that tells people about something that will happen.",
            answer: "Notice",
            options: [
                WordOption(word: "Notice", meaning: "通知"),
                WordOption(word: "Office", meaning: "事務所"),
                WordOption(word: "Justice", meaning: "正義"),
                WordOption(word: "Advice", meaning: "助言")
            ],
            hint: "「通知」や「お知らせ」のこと。掲示板によく貼ってあるよ。動詞で「〜に気づく」という意味でも使う、とっても便利な単語だよ。",
            level: .beginner
        ),
        Question(
            text: "A length of time.",
            answer: "Period",
            options: [
                WordOption(word: "Period", meaning: "期間"),
                WordOption(word: "Person", meaning: "人"),
                WordOption(word: "Proud", meaning: "誇らしい"),
                WordOption(word: "Perfect", meaning: "完璧な")
            ],
            hint: "一定の「期間」のこと。授業の「1時間目」などもこう呼ぶよ。文の終わりの「ピリオド（.）」も同じスペル。ここで一旦区切りだね！",
            level: .beginner
        ),
        Question(
            text: "A planned piece of work that has a specific goal.",
            answer: "Project",
            options: [
                WordOption(word: "Project", meaning: "計画・事業"),
                WordOption(word: "Protect", meaning: "守る"),
                WordOption(word: "Product", meaning: "製品"),
                WordOption(word: "Perfect", meaning: "完璧な")
            ],
            hint: "目標を持って進める「プロジェクト（計画）」のこと。Protect（守る）と音が似ているから聞き取りに注意して。君の英語学習プロジェクト、順調だね！",
            level: .beginner
        ),
        Question(
            text: "A piece of paper that shows you have paid for something.",
            answer: "Receipt",
            options: [
                WordOption(word: "Receipt", meaning: "領収書"),
                WordOption(word: "Recipe", meaning: "レシピ"),
                WordOption(word: "Accept", meaning: "受け入れる"),
                WordOption(word: "Concept", meaning: "概念")
            ],
            hint: "「領収書」や「レシート」のこと。pは発音しないよ。Recipe（レシピ）とよく似ているから、料理をせずに買い物だけ済ませないようにね！",
            level: .beginner
        ),
        Question(
            text: "One part of a group, a company, or a store.",
            answer: "Section",
            options: [
                WordOption(word: "Section", meaning: "部門"),
                WordOption(word: "Selection", meaning: "選択"),
                WordOption(word: "Session", meaning: "期間・会合"),
                WordOption(word: "Station", meaning: "駅")
            ],
            hint: "会社や組織の「部門」や、お店の「コーナー」のこと。全体のなかの「一部」というニュアンスだよ。Selection（選択）と見間違えないようにね。",
            level: .beginner
        ),
        Question(
            text: "The main thing that you are talking about or studying.",
            answer: "Subject",
            options: [
                WordOption(word: "Subject", meaning: "主題・科目"),
                WordOption(word: "Object", meaning: "物体"),
                WordOption(word: "Reject", meaning: "拒絶する"),
                WordOption(word: "Suggest", meaning: "提案する")
            ],
            hint: "話の「テーマ」や学校の「教科」のこと。メールの「件名」もこれだよ。君が今 studying しているこの subject、最強に役に立つよ！",
            level: .beginner
        ),
        Question(
            text: "All the cars and buses moving on the road.",
            answer: "Traffic",
            options: [
                WordOption(word: "Traffic", meaning: "交通"),
                WordOption(word: "Terrific", meaning: "素晴らしい"),
                WordOption(word: "Tragedy", meaning: "悲劇"),
                WordOption(word: "Tropical", meaning: "熱帯の")
            ],
            hint: "道路の「交通量」や「車」の流れのこと。'Traffic jam' で交通渋滞。Terrific（素晴らしい）と間違えると、渋滞が素晴らしいことになっちゃうよ！",
            level: .beginner
        ),
        Question(
            text: "To start to be seen, or to arrive at a place.",
            answer: "Appear",
            options: [
                WordOption(word: "Appear", meaning: "現れる"),
                WordOption(word: "Appeal", meaning: "訴える"),
                WordOption(word: "Approve", meaning: "承認する"),
                WordOption(word: "Apply", meaning: "申し込む")
            ],
            hint: "パッと「現れる」こと。反対は Disappear（消える）。Appeal（アピールする）と音が似ているから、しっかり聞き分けていこう！",
            level: .beginner
        ),
        Question(
            text: "To say yes to an offer or an invitation.",
            answer: "Accept",
            options: [
                WordOption(word: "Accept", meaning: "受け入れる"),
                WordOption(word: "Except", meaning: "〜を除いて"),
                WordOption(word: "Expect", meaning: "期待する"),
                WordOption(word: "Aspect", meaning: "側面")
            ],
            hint: "招待やプレゼントを「受け入れる」こと。音がそっくりな Except（〜を除いて）や Expect（期待する）は超強敵。今のうちに仲良くなっておこう！",
            level: .beginner
        ),
        Question(
            text: "To reach a place at the end of a journey.",
            answer: "Arrive",
            options: [
                WordOption(word: "Arrive", meaning: "到着する"),
                WordOption(word: "Alive", meaning: "生きている"),
                WordOption(word: "Advice", meaning: "助言"),
                WordOption(word: "Achieve", meaning: "達成する")
            ],
            hint: "目的地に「到着する」こと。LとRが違う Alive（生きている）と間違えると大変。無事に目的地に arrive できるようにスペルをチェック！",
            level: .beginner
        ),
        Question(
            text: "To let someone do something, or to make it possible.",
            answer: "Allow",
            options: [
                WordOption(word: "Allow", meaning: "許す"),
                WordOption(word: "Arrow", meaning: "矢"),
                WordOption(word: "Alone", meaning: "一人で"),
                WordOption(word: "Along", meaning: "〜に沿って")
            ],
            hint: "「許可する」こと。'Allow me' と言うと「私にやらせてください」という紳士な表現になるよ。Arrow（矢）が飛んでこないように発音に気をつけて！",
            level: .beginner
        ),
        Question(
            text: "To take someone or something with you to a place.",
            answer: "Bring",
            options: [
                WordOption(word: "Bring", meaning: "持ってくる"),
                WordOption(word: "Blind", meaning: "目が見えない"),
                WordOption(word: "Bland", meaning: "味が薄い"),
                WordOption(word: "Bridge", meaning: "橋")
            ],
            hint: "自分と一緒に何かを「持ってくる」こと。話し手に近づくイメージだよ。反対は Take（持っていく）。大切なものは、常に心に bring しておこう！",
            level: .beginner
        ),
        Question(
            text: "To use a name to talk to someone, or to use a telephone.",
            answer: "Call",
            options: [
                WordOption(word: "Call", meaning: "呼ぶ・電話する"),
                WordOption(word: "Coal", meaning: "石炭"),
                WordOption(word: "Cool", meaning: "涼しい"),
                WordOption(word: "Cell", meaning: "細胞")
            ],
            hint: "名前を「呼ぶ」ときにも、電話を「かける」ときにも使うよ。Cool（かっこいい）な君なら、きっとすぐに使いこなせるはずだね！",
            level: .beginner
        ),
        Question(
            text: "To make a picture with a pen or a pencil.",
            answer: "Draw",
            options: [
                WordOption(word: "Draw", meaning: "描く・引く"),
                WordOption(word: "Door", meaning: "ドア"),
                WordOption(word: "Drink", meaning: "飲む"),
                WordOption(word: "Dress", meaning: "服を着る")
            ],
            hint: "線で絵を「描く」こと。カーテンを「引く」ときにも使うよ。ペンを持って、未来の自分を draw してみよう！",
            level: .beginner
        ),
        Question(
            text: "To think that something will happen.",
            answer: "Expect",
            options: [
                WordOption(word: "Expect", meaning: "期待する"),
                WordOption(word: "Except", meaning: "〜を除いて"),
                WordOption(word: "Expert", meaning: "専門家"),
                WordOption(word: "Aspect", meaning: "側面")
            ],
            hint: "「こうなるだろうな」と予期したり「期待」すること。Except（除いて）や Expert（専門家）と紛らわしいけど、君の成長をみんな expect してるよ！",
            level: .beginner
        ),
        Question(
            text: "To tell someone information so that they can understand it.",
            answer: "Explain",
            options: [
                WordOption(word: "Explain", meaning: "説明する"),
                WordOption(word: "Explore", meaning: "探検する"),
                WordOption(word: "Express", meaning: "表現する"),
                WordOption(word: "Expose", meaning: "さらす")
            ],
            hint: "分かりやすく「説明する」こと。名詞は Explanation。Explore（探検）して見つけたものを、誰かに explain してあげよう！",
            level: .beginner
        ),
        Question(
            text: "A person who is professional at a sport, like running or jumping.",
            answer: "Athlete",
            options: [
                WordOption(word: "Athlete", meaning: "運動選手"),
                WordOption(word: "Author", meaning: "著者・作家"),
                WordOption(word: "Artist", meaning: "芸術家"),
                WordOption(word: "Actor", meaning: "俳優")
            ],
            hint: "スポーツを頑張る「アスリート（運動選手）」のこと。日本語でもよく使う言葉だね。毎日学習を続ける君も、脳のアスリートだ！",
            level: .beginner
        ),
        Question(
            text: "A large group of people who live together in a country with the same rules.",
            answer: "Society",
            options: [
                WordOption(word: "Society", meaning: "社会"),
                WordOption(word: "Section", meaning: "部分・部門"),
                WordOption(word: "Science", meaning: "科学"),
                WordOption(word: "Service", meaning: "奉仕・サービス")
            ],
            hint: "私たちが暮らしている「社会」のこと。人とのつながり（social）が集まってできているんだ。一歩外に出れば、そこは社会だよ。",
            level: .beginner
        ),
        Question(
            text: "To travel through an area to learn about it.",
            answer: "Explore",
            options: [
                WordOption(word: "Explore", meaning: "探検する・調査する"),
                WordOption(word: "Explode", meaning: "爆発する"),
                WordOption(word: "Expose", meaning: "さらす・暴露する"),
                WordOption(word: "Express", meaning: "表現する")
            ],
            hint: "知らない場所を「探検する」こと。Internet Explorer というブラウザの名前に聞き覚えはないかな？",
            level: .beginner
        ),
        
        Question(
            text: "To give someone information or tell them something.",
            answer: "Inform",
            options: [
                WordOption(word: "Inform", meaning: "知らせる"),
                WordOption(word: "Confirm", meaning: "確認する"),
                WordOption(word: "Perform", meaning: "演じる・行う"),
                WordOption(word: "Reform", meaning: "改革する")
            ],
            hint: "誰かに何かを「知らせる」こと。名詞の information（情報）と一緒に覚えれば、もう君の知識の一部だね！",
            level: .beginner
        ),
        Question(
            text: "To say that you are sorry for something you did wrong.",
            answer: "Apologize",
            options: [
                WordOption(word: "Apologize", meaning: "謝罪する"),
                WordOption(word: "Analyze", meaning: "分析する"),
                WordOption(word: "Advertise", meaning: "宣伝する"),
                WordOption(word: "Recognize", meaning: "認める")
            ],
            hint: "「ごめんなさい」と謝ること。素直に謝れる人は素敵だよね。名詞の apology（謝罪）もセットで覚えておこう！",
            level: .beginner
        ),
        Question(
            text: "To find something for the first time.",
            answer: "Discover",
            options: [
                WordOption(word: "Discover", meaning: "発見する"),
                WordOption(word: "Recover", meaning: "回復する"),
                WordOption(word: "Deliver", meaning: "届ける"),
                WordOption(word: "Uncover", meaning: "暴く")
            ],
            hint: "新しいことを「発見する」こと。dis（否定）+ cover（覆い）で、隠れていたものを見つけるイメージ。君の新しい才能を discover しよう！",
            level: .beginner
        ),
        Question(
            text: "To use your time or money to do something.",
            answer: "Spend",
            options: [
                WordOption(word: "Spend", meaning: "費やす・使う"),
                WordOption(word: "Speed", meaning: "速度"),
                WordOption(word: "Send", meaning: "送る"),
                WordOption(word: "Stand", meaning: "立つ")
            ],
            hint: "お金を「使う」だけでなく、時間を「過ごす」時にも使うよ。大切な時間は、ぜひこのアプリでの学習に spend してね！",
            level: .beginner
        ),
        Question(
            text: "To tell someone about a danger or a problem.",
            answer: "Warn",
            options: [
                WordOption(word: "Warn", meaning: "警告する・知らせる"),
                WordOption(word: "Warm", meaning: "温かい"),
                WordOption(word: "Worm", meaning: "虫"),
                WordOption(word: "Word", meaning: "単語")
            ],
            hint: "危ないことを「警告する」こと。綴りが似ている warm（温かい）や worm（虫）と間違えないようにね。君の安全を守るための合図だよ。",
            level: .beginner
        ),
        Question(
            text: "A yellow or white food made from milk.",
            answer: "Cheese",
            options: [
                WordOption(word: "Cheese", meaning: "チーズ"),
                WordOption(word: "Choose", meaning: "選ぶ"),
                WordOption(word: "Chase", meaning: "追いかける"),
                WordOption(word: "Cheer", meaning: "元気づける")
            ],
            hint: "牛乳から作られる「チーズ」のこと。写真を撮るときの定番フレーズ 'Say cheese!' もおなじみだね！",
            level: .beginner
        ),
        Question(
            text: "A completely round shape, like a ring.",
            answer: "Circle",
            options: [
                WordOption(word: "Circle", meaning: "円・輪・サークル"),
                WordOption(word: "Cycle", meaning: "周期・自転車"),
                WordOption(word: "Circus", meaning: "サーカス"),
                WordOption(word: "Search", meaning: "探す")
            ],
            hint: "きれいな丸い形をした「円・輪」のこと。共通の趣味を持った仲間が集まる「サークル」の意味でも使うよ。",
            level: .beginner
        ),
        Question(
            text: "Not dirty, or free from marks.",
            answer: "Clean",
            options: [
                WordOption(word: "Clean", meaning: "きれいな・掃除する"),
                WordOption(word: "Clear", meaning: "透明な・晴れた"),
                WordOption(word: "Clerk", meaning: "店員"),
                WordOption(word: "Clever", meaning: "利口な")
            ],
            hint: "汚れがなくて「きれいな」状態のこと。日本語でもクリーンと言ったら、清潔でクリアなプラスのイメージだね！",
            level: .beginner
        ),
        Question(
            text: "A thing that shows the time in a room or building.",
            answer: "Clock",
            options: [
                WordOption(word: "Clock", meaning: "時計・置時計"),
                WordOption(word: "Clerk", meaning: "店員"),
                WordOption(word: "Cloak", meaning: "クローク・外套"),
                WordOption(word: "Block", meaning: "ブロック・街区")
            ],
            hint: "壁掛けや机に置く「時計」のこと。腕につける腕時計は watch と言って、はっきり区別されるんだよ。",
            level: .beginner
        ),
        Question(
            text: "To pick up and take someone or something to another place.",
            answer: "Collect",
            options: [
                WordOption(word: "Collect", meaning: "集める・回収する"),
                WordOption(word: "Correct", meaning: "正しい・訂正する"),
                WordOption(word: "Connect", meaning: "つなぐ"),
                WordOption(word: "Select", meaning: "選ぶ")
            ],
            hint: "バラバラなものを「集める」こと。ゴミの回収や、趣味のコレクションもこれ！LとRの区別が難しい correct（正しい）とセットで気をつけて！",
            level: .beginner
        ),
        Question(
            text: "Happening or done every day.",
            answer: "Daily",
            options: [
                WordOption(word: "Daily", meaning: "毎日の・日刊の"),
                WordOption(word: "Dairy", meaning: "乳製品の"),
                WordOption(word: "Duly", meaning: "正当に"),
                WordOption(word: "Delay", meaning: "遅らせる")
            ],
            hint: "「毎日」のこと。綴りがそっくりの dairy（乳製品）は、テストで一番狙われるトラップだから気をつけて！",
            level: .beginner
        ),
        Question(
            text: "Information, especially facts or numbers, used to help make decisions.",
            answer: "Data",
            options: [
                WordOption(word: "Data", meaning: "データ・資料"),
                WordOption(word: "Date", meaning: "日付・デート"),
                WordOption(word: "Debt", meaning: "借金"),
                WordOption(word: "Detail", meaning: "詳細")
            ],
            hint: "日本語でもおなじみの「データ」だね。単数形でも複数形でも data と呼ぶのが一般的だよ！",
            level: .beginner
        ),
        Question(
            text: "A person who works at a desk in a hotel or office building.",
            answer: "Receptionist",
            options: [
                WordOption(word: "Receptionist", meaning: "受付係"),
                WordOption(word: "Pharmacist", meaning: "薬剤師"),
                WordOption(word: "Specialist", meaning: "専門家"),
                WordOption(word: "Journalist", meaning: "記者")
            ],
            hint: "ホテルのフロントなどで最初に応対してくれる「受付さん」のこと。receive（受け取る）人、と覚えるとスペルも怖くないよ！",
            level: .beginner
        ),
        Question(
            text: "Not including a particular person or thing.",
            answer: "Except",
            options: [
                WordOption(word: "Except", meaning: "〜を除いて"),
                WordOption(word: "Expect", meaning: "期待する"),
                WordOption(word: "Accept", meaning: "受け入れる"),
                WordOption(word: "Expert", meaning: "専門家")
            ],
            hint: "「〜以外は」という時の言葉。つづりが似ている expect（期待する）や accept（受け入れる）との見分けが、初級脱出の鍵だよ！",
            level: .beginner
        ),
        Question(
            text: "To make someone feel very happy and enthusiastic.",
            answer: "Excite",
            options: [
                WordOption(word: "Excite", meaning: "興奮させる・わくわくさせる"),
                WordOption(word: "Excuse", meaning: "言い訳・許す"),
                WordOption(word: "Execute", meaning: "実行する"),
                WordOption(word: "Exile", meaning: "追放する")
            ],
            hint: "人を「わくわくさせる」こと。『エキサイティング』の動詞形だね。新しい単語を覚える楽しさに、心を excite させていこう！",
            level: .beginner
        ),
        Question(
            text: "To think that something is true, although you are not sure.",
            answer: "Guess",
            options: [
                WordOption(word: "Guess", meaning: "推測する"),
                WordOption(word: "Guest", meaning: "来客"),
                WordOption(word: "Guide", meaning: "案内する"),
                WordOption(word: "Guard", meaning: "守る")
            ],
            hint: "「たぶんこうかな？」と予想すること。'Guess what?'（ねえ聞いて！）は会話のきっかけに超便利なフレーズだよ！",
            level: .beginner
        ),
        Question(
            text: "To keep someone or something safe from danger or harm.",
            answer: "Protect",
            options: [
                WordOption(word: "Protect", meaning: "守る・保護する"),
                WordOption(word: "Project", meaning: "計画・事業"),
                WordOption(word: "Product", meaning: "製品"),
                WordOption(word: "Predict", meaning: "予測する")
            ],
            hint: "大切なものを「守る」こと。パスワードや環境を守る時にも使うよ。スマホの画面を守る「プロテクター」もこの仲間だね！",
            level: .beginner
        ),
        Question(
            text: "A building where people go to see interesting and old things.",
            answer: "Museum",
            options: [
                WordOption(word: "Museum", meaning: "博物館・美術館"),
                WordOption(word: "Stadium", meaning: "競技場"),
                WordOption(word: "Medium", meaning: "媒体・中間の"),
                WordOption(word: "Premium", meaning: "高級な・保険料")
            ],
            hint: "歴史的なものやアートが並ぶ「博物館」や「美術館」のこと。似た終わりの単語が多いから、建物のイメージと一緒に覚えよう！",
            level: .beginner
        ),
        Question(
            text: "A machine that helps you do math.",
            answer: "Calculator",
            options: [
                WordOption(word: "Calculator", meaning: "計算機"),
                WordOption(word: "Calendar", meaning: "カレンダー"),
                WordOption(word: "Collector", meaning: "収集家"),
                WordOption(word: "Conductor", meaning: "指揮者")
            ],
            hint: "数字の計算をしてくれる「電卓」のこと。calculate（計算する）するための道具だよ。",
            level: .beginner
        ),
        Question(
            text: "A person who cuts and styles people's hair.",
            answer: "Barber",
            options: [
                WordOption(word: "Barber", meaning: "理髪師"),
                WordOption(word: "Baker", meaning: "パン屋"),
                WordOption(word: "Banker", meaning: "銀行員"),
                WordOption(word: "Builder", meaning: "建築業者")
            ],
            hint: "髪を切ってくれる「床屋・理容師」さんのこと。美容室は hair salon と言うことが多いね。",
            level: .beginner
        ),
        Question(
            text: "To produce a liquid from your eyes when you are sad.",
            answer: "Cry",
            options: [
                WordOption(word: "Cry", meaning: "泣く"),
                WordOption(word: "Dry", meaning: "乾かす"),
                WordOption(word: "Try", meaning: "試す"),
                WordOption(word: "Fly", meaning: "飛ぶ")
            ],
            hint: "悲しい時や痛い時に「泣く」こと。叫ぶという意味で使われることもあるよ。",
            level: .beginner
        ),
        Question(
            text: "A person who serves food and drinks in a restaurant.",
            answer: "Waiter",
            options: [
                WordOption(word: "Waiter", meaning: "給仕（男性）"),
                WordOption(word: "Writer", meaning: "作家"),
                WordOption(word: "Worker", meaning: "労働者"),
                WordOption(word: "Walker", meaning: "歩行者")
            ],
            hint: "レストランで注文を取ったり料理を運んだりする「ウェイター」さんのこと。女性の場合は waitress と言うよ。",
            level: .beginner
        ),
        Question(
            text: "To use a pen or pencil to make words on paper.",
            answer: "Write",
            options: [
                WordOption(word: "Write", meaning: "書く"),
                WordOption(word: "Right", meaning: "正しい"),
                WordOption(word: "White", meaning: "白い"),
                WordOption(word: "Light", meaning: "軽い・光")
            ],
            hint: "手紙や日記を「書く」こと。発音が同じ right（正しい）や white（白い）と間違えないようにね。",
            level: .beginner
        ),
        Question(
            text: "A place where people live that is smaller than a city.",
            answer: "Village",
            options: [
                WordOption(word: "Village", meaning: "村"),
                WordOption(word: "Valley", meaning: "谷"),
                WordOption(word: "Voltage", meaning: "電圧"),
                WordOption(word: "Voyage", meaning: "船旅")
            ],
            hint: "町よりも小さくて静かな「村」のこと。のんびりした田舎の風景を想像してみてね。",
            level: .beginner
        ),
        Question(
            text: "To move through water using your arms and legs.",
            answer: "Swim",
            options: [
                WordOption(word: "Swim", meaning: "泳ぐ"),
                WordOption(word: "Slim", meaning: "細い"),
                WordOption(word: "Swing", meaning: "揺れる"),
                WordOption(word: "Smile", meaning: "笑う")
            ],
            hint: "プールや海で「泳ぐ」こと。夏になると楽しみなスポーツだね！",
            level: .beginner
        ),
        Question(
            text: "A person who makes bread and cakes as a job.",
            answer: "Baker",
            options: [
                WordOption(word: "Baker", meaning: "パン職人"),
                WordOption(word: "Banker", meaning: "銀行員"),
                WordOption(word: "Broker", meaning: "仲介人"),
                WordOption(word: "Buyer", meaning: "買い手")
            ],
            hint: "美味しいパンを焼く「パン屋さん」のこと。bakery（パン屋の店舗）で働く人だよ。",
            level: .beginner
        ),
        Question(
            text: "To make music with your voice.",
            answer: "Sing",
            options: [
                WordOption(word: "Sing", meaning: "歌う"),
                WordOption(word: "Song", meaning: "歌"),
                WordOption(word: "Sink", meaning: "沈む"),
                WordOption(word: "Sign", meaning: "署名")
            ],
            hint: "メロディに合わせて「歌う」こと。名詞の song（歌）とセットで覚えよう。",
            level: .beginner
        ),
        Question(
            text: "A place where you can go to see a doctor when you are sick.",
            answer: "Hospital",
            options: [
                WordOption(word: "Hospital", meaning: "病院"),
                WordOption(word: "Hotel", meaning: "ホテル"),
                WordOption(word: "Hostel", meaning: "ホステル"),
                WordOption(word: "Holiday", meaning: "休日")
            ],
            hint: "怪我や病気を治しに行く大きな「病院」のこと。困った時に助けてくれる場所だね。",
            level: .beginner
        ),
        Question(
            text: "To go up something, like a tree or a mountain.",
            answer: "Climb",
            options: [
                WordOption(word: "Climb", meaning: "登る"),
                WordOption(word: "Clean", meaning: "掃除する"),
                WordOption(word: "Close", meaning: "閉める"),
                WordOption(word: "Claim", meaning: "主張する")
            ],
            hint: "山や階段を「登る」こと。最後の 'b' は発音しないのがポイントだよ。",
            level: .beginner
        ),
        Question(
            text: "A person who works on a farm with animals and plants.",
            answer: "Farmer",
            options: [
                WordOption(word: "Farmer", meaning: "農家"),
                WordOption(word: "Former", meaning: "前の"),
                WordOption(word: "Follower", meaning: "追従者"),
                WordOption(word: "Father", meaning: "父親")
            ],
            hint: "野菜を育てたり動物を飼ったりする「農家の人」のこと。おいしい食べ物を作ってくれる大切な仕事だね。",
            level: .beginner
        ),
        Question(
            text: "To use your teeth to cut food into small pieces.",
            answer: "Chew",
            options: [
                WordOption(word: "Chew", meaning: "噛む"),
                WordOption(word: "Choose", meaning: "選ぶ"),
                WordOption(word: "Check", meaning: "確認"),
                WordOption(word: "Show", meaning: "見せる")
            ],
            hint: "食べ物を「よく噛む」こと。チューインガム（chewing gum）の chew はこの言葉だよ。",
            level: .beginner
        ),
        Question(
            text: "A person who works in a library.",
            answer: "Librarian",
            options: [
                WordOption(word: "Librarian", meaning: "司書"),
                WordOption(word: "Library", meaning: "図書館"),
                WordOption(word: "Liberty", meaning: "自由"),
                WordOption(word: "Liberal", meaning: "自由主義の")
            ],
            hint: "図書館で働く人のことだよ。-ian は「〜の人」を表すことが多いんだ。静かな場所で働くイメージだね！",
            level: .beginner
        ),
        Question(
            text: "To look for something that is lost or hidden.",
            answer: "Search",
            options: [
                WordOption(word: "Search", meaning: "探す"),
                WordOption(word: "Research", meaning: "研究する"),
                WordOption(word: "Speech", meaning: "演説"),
                WordOption(word: "Switch", meaning: "切り替える")
            ],
            hint: "失くしたものや情報を「探す」こと。インターネットで検索するのも search だね。見つかるといいね！",
            level: .beginner
        ),
        Question(
            text: "A person who visits a new place for fun.",
            answer: "Tourist",
            options: [
                WordOption(word: "Tourist", meaning: "観光客"),
                WordOption(word: "Terrorist", meaning: "テロリスト"),
                WordOption(word: "Journalist", meaning: "記者"),
                WordOption(word: "Typist", meaning: "タイピスト")
            ],
            hint: "旅行を楽しんでいる「観光客」のこと。tour（旅行）をする人、と覚えれば簡単だね！",
            level: .beginner
        ),
        Question(
            text: "To help someone remember something.",
            answer: "Remind",
            options: [
                WordOption(word: "Remind", meaning: "思い出させる"),
                WordOption(word: "Remember", meaning: "覚えている"),
                WordOption(word: "Remain", meaning: "残る"),
                WordOption(word: "Repair", meaning: "修理する")
            ],
            hint: "「あ、忘れてた！」とならないように、誰かに「思い出させる」こと。スマホのリマインダー機能でおなじみだね。",
            level: .beginner
        ),
        Question(
            text: "To say something is not true or to say no to something.",
            answer: "Refuse",
            options: [
                WordOption(word: "Refuse", meaning: "断る"),
                WordOption(word: "Reuse", meaning: "再利用する"),
                WordOption(word: "Reduce", meaning: "減らす"),
                WordOption(word: "Confuse", meaning: "混乱させる")
            ],
            hint: "何かを「断る」とか、拒否すること。強い意志を持って「ノー」と言う情景だよ。",
            level: .beginner
        ),
        
        // MARK: - Intermediate
        Question(
            text: "To give someone something that they want or need.",
            answer: "Provide",
            options: [
                WordOption(word: "Provide", meaning: "提供する"),
                WordOption(word: "Prove", meaning: "証明する"),
                WordOption(word: "Prevent", meaning: "防ぐ"),
                WordOption(word: "Produce", meaning: "生産する")
            ],
            hint: "「欲しがっているものや必要なものを与えること」つまり「提供する」という意味です。名詞形の provision もセットで覚えておきましょう。",
            level: .intermediate
        ),
        Question(
            text: "An important, interesting, or special part of something.",
            answer: "Feature",
            options: [
                WordOption(word: "Feature", meaning: "特徴"),
                WordOption(word: "Future", meaning: "未来"),
                WordOption(word: "Failure", meaning: "失敗"),
                WordOption(word: "Figure", meaning: "図・数字")
            ],
            hint: "「何かの中の重要で特別な部分」つまり「特徴」という意味になります。よく「スマホの新機能」なども new feature と言いますよ。",
            level: .intermediate
        ),
        Question(
            text: "To need something or tell someone that they must do something.",
            answer: "Require",
            options: [
                WordOption(word: "Require", meaning: "必要とする"),
                WordOption(word: "Request", meaning: "要請する"),
                WordOption(word: "Retire", meaning: "退職する"),
                WordOption(word: "Acquire", meaning: "獲得する")
            ],
            hint: "「何かを必要とする、または人に何かをしなければならないと伝えること」で、「必要とする」「要求する」という意味です。",
            level: .intermediate
        ),
        Question(
            text: "To separate something into two or more parts.",
            answer: "Divide",
            options: [
                WordOption(word: "Divide", meaning: "分ける・分割する"),
                WordOption(word: "Device", meaning: "装置"),
                WordOption(word: "Decide", meaning: "決定する"),
                WordOption(word: "Provide", meaning: "提供する")
            ],
            hint: "ひとつをいくつかに「分ける」こと。算数の割り算もこれだよ。ピザをみんなで divide して食べる情景を浮かべてみて！",
            level: .intermediate
        ),
        Question(
            text: "The ability to do something well without wasting time or energy.",
            answer: "Efficiency",
            options: [
                WordOption(word: "Efficiency", meaning: "効率・能率"),
                WordOption(word: "Efficacy", meaning: "効能"),
                WordOption(word: "Emergency", meaning: "緊急事態"),
                WordOption(word: "Agency", meaning: "代理店")
            ],
            hint: "ムダなくこなす「効率」のこと。仕事や勉強の『タイパ』を上げるときに欠かせないキーワードだね。",
            level: .intermediate
        ),
        Question(
            text: "To lift something to a higher position, or to improve someone's rank.",
            answer: "Elevate",
            options: [
                WordOption(word: "Elevate", meaning: "高める・持ち上げる"),
                WordOption(word: "Evaluate", meaning: "評価する"),
                WordOption(word: "Elaborate", meaning: "詳しく述べる"),
                WordOption(word: "Deviate", meaning: "逸脱する")
            ],
            hint: "位置や気分を「高める」こと。エレベーター（elevator）と同じ仲間で、グッと上に引き上げるイメージだよ！",
            level: .intermediate
        ),
        Question(
            text: "To burst or blow up with a loud noise.",
            answer: "Explode",
            options: [
                WordOption(word: "Explode", meaning: "爆発する・急増する"),
                WordOption(word: "Explore", meaning: "探検する"),
                WordOption(word: "Exclude", meaning: "除外する"),
                WordOption(word: "Expose", meaning: "さらす")
            ],
            hint: "大きな音を立てて「爆発する」こと。感情が爆発したり、人気が急上昇したりするときにも使われるパワフルな単語だよ！",
            level: .intermediate
        ),
        Question(
            text: "To send goods to another country for sale.",
            answer: "Export",
            options: [
                WordOption(word: "Export", meaning: "輸出する"),
                WordOption(word: "Import", meaning: "輸入する"),
                WordOption(word: "Expert", meaning: "専門家"),
                WordOption(word: "Report", meaning: "報告する")
            ],
            hint: "自分の国から外へ「輸出する」こと。 ex（外へ）+ port（港）という語源そのままだね。反対の import（輸入）とセットで覚えよう！",
            level: .intermediate
        ),
        Question(
            text: "To notice or understand the difference between two things.",
            answer: "Distinguish",
            options: [
                WordOption(word: "Distinguish", meaning: "見分ける・区別する"),
                WordOption(word: "Extinguish", meaning: "（火を）消す"),
                WordOption(word: "Describe", meaning: "描写する"),
                WordOption(word: "Dislike", meaning: "嫌う")
            ],
            hint: "AとBの違いを「見分ける、区別する」こと。少し長い単語だけど、読解には必須！間違い選択肢の extinguish（消す）と間違えないようにね。",
            level: .intermediate
        ),
        Question(
            text: "To have someone or something as a part of a group.",
            answer: "Include",
            options: [
                WordOption(word: "Include", meaning: "含む"),
                WordOption(word: "Exclude", meaning: "除外する"),
                WordOption(word: "Improve", meaning: "向上させる"),
                WordOption(word: "Indicate", meaning: "示す")
            ],
            hint: "「グループの一部として人や物を持っていること」つまり「含む」という意味です。",
            level: .intermediate
        ),
        Question(
            text: "Many different types of things or people.",
            answer: "Various",
            options: [
                WordOption(word: "Various", meaning: "さまざまな"),
                WordOption(word: "Obvious", meaning: "明らかな"),
                WordOption(word: "Serious", meaning: "深刻な"),
                WordOption(word: "Previous", meaning: "以前の")
            ],
            hint: "「たくさんの異なる種類の人や物」で、「さまざまな」という意味になります。",
            level: .intermediate
        ),
        Question(
            text: "To give someone the power or the right to do something.",
            answer: "Authorize",
            options: [
                WordOption(word: "Authorize", meaning: "権限を与える"),
                WordOption(word: "Authenticate", meaning: "認証する"),
                WordOption(word: "Automate", meaning: "自動化する"),
                WordOption(word: "Organize", meaning: "組織する")
            ],
            hint: "誰かに「いいよ、やっていいよ」と公式に許可や権限を与えることです。",
            level: .intermediate
        ),
        Question(
            text: "To keep something the same or to stop it from changing.",
            answer: "Maintain",
            options: [
                WordOption(word: "Maintain", meaning: "維持する"),
                WordOption(word: "Mountain", meaning: "山"),
                WordOption(word: "Contain", meaning: "含む"),
                WordOption(word: "Entertain", meaning: "楽しませる")
            ],
            hint: "良い状態が変わらないように「キープする、維持する」という意味です。",
            level: .intermediate
        ),
        Question(
            text: "A person who buys things or uses services.",
            answer: "Consumer",
            options: [
                WordOption(word: "Consumer", meaning: "消費者"),
                WordOption(word: "Customer", meaning: "顧客"),
                WordOption(word: "Producer", meaning: "生産者"),
                WordOption(word: "Container", meaning: "容器")
            ],
            hint: "サービスを利用する「消費者」のこと。初級で習った customer（顧客）よりも少し広い意味で使われる言葉だよ。",
            level: .intermediate
        ),
        Question(
            text: "To have something inside, or to keep something within a space.",
            answer: "Contain",
            options: [
                WordOption(word: "Contain", meaning: "含んでいる・入っている"),
                WordOption(word: "Content", meaning: "内容・満足して"),
                WordOption(word: "Concept", meaning: "概念"),
                WordOption(word: "Connect", meaning: "つなぐ")
            ],
            hint: "中に何かを「含んでいる」こと。入れ物の『コンテナ』は、中に物を入れるからその名前がついたんだよ。",
            level: .intermediate
        ),
        Question(
            text: "To be made of or formed from something.",
            answer: "Consist",
            options: [
                WordOption(word: "Consist", meaning: "〜から成る・成り立つ"),
                WordOption(word: "Consistent", meaning: "一貫した"),
                WordOption(word: "Contrast", meaning: "対照"),
                WordOption(word: "Confirm", meaning: "確認する")
            ],
            hint: "何かで「成り立っている」こと。 'consist of ~' の形でよく使う、とてもスマートな言葉だよ。",
            level: .intermediate
        ),
        Question(
            text: "A person who is traveling to work and back every day.",
            answer: "Commuter",
            options: [
                WordOption(word: "Commuter", meaning: "通勤者"),
                WordOption(word: "Computer", meaning: "コンピュータ"),
                WordOption(word: "Consumer", meaning: "消費者"),
                WordOption(word: "Customer", meaning: "顧客")
            ],
            hint: "家と職場や学校の間を毎日行き来する「通学者・通勤者」のこと。",
            level: .intermediate
        ),
        Question(
            text: "A plan that shows when things will happen or be done.",
            answer: "Schedule",
            options: [
                WordOption(word: "Schedule", meaning: "予定・計画"),
                WordOption(word: "Scheme", meaning: "計画・企み"),
                WordOption(word: "Scholar", meaning: "学者"),
                WordOption(word: "School", meaning: "学校")
            ],
            hint: "いつ、何をするかを決めた「時間表」や「予定」のこと。ビジネスシーンでは欠かせない単語だね。",
            level: .intermediate
        ),
        Question(
            text: "To buy something by paying money for it.",
            answer: "Purchase",
            options: [
                WordOption(word: "Purchase", meaning: "購入する"),
                WordOption(word: "Purpose", meaning: "目的"),
                WordOption(word: "Practice", meaning: "練習する"),
                WordOption(word: "Pursue", meaning: "追求する")
            ],
            hint: "buy よりも少し丁寧で硬い「購入する」という言葉。",
            level: .intermediate
        ),
        Question(
            text: "To be able to pay for something because you have enough money.",
            answer: "Afford",
            options: [
                WordOption(word: "Afford", meaning: "余裕がある"),
                WordOption(word: "Effort", meaning: "努力"),
                WordOption(word: "Award", meaning: "賞"),
                WordOption(word: "Abroad", meaning: "海外へ")
            ],
            hint: "can afford to 〜 で「〜する（金銭的・時間的）余裕がある」という形でよく使われるよ。",
            level: .intermediate
        ),
        Question(
            text: "A set of clothes that people wear for work or school.",
            answer: "Uniform",
            options: [
                WordOption(word: "Uniform", meaning: "制服"),
                WordOption(word: "Unique", meaning: "独特な"),
                WordOption(word: "Unite", meaning: "団結させる"),
                WordOption(word: "Universe", meaning: "宇宙")
            ],
            hint: "みんなが同じ（uni）形（form）の服を着るから「制服」。",
            level: .intermediate
        ),
        Question(
            text: "To move something or someone from one place to another.",
            answer: "Transport",
            options: [
                WordOption(word: "Transport", meaning: "輸送する・運ぶ"),
                WordOption(word: "Transform", meaning: "変形させる"),
                WordOption(word: "Transmit", meaning: "送信する"),
                WordOption(word: "Transparent", meaning: "透明な")
            ],
            hint: "物や人を別の場所へ「運ぶ」こと。Trans（越えて）+ port（運ぶ・港）という語源を知っていると、空港や港のイメージが湧きやすいね！",
            level: .intermediate
        ),
        Question(
            text: "To give your time, money, or effort to help something succeed.",
            answer: "Contribute",
            options: [
                WordOption(word: "Contribute", meaning: "貢献する・寄付する"),
                WordOption(word: "Distribute", meaning: "分配する・配布する"),
                WordOption(word: "Attribute", meaning: "〜のせいにする"),
                WordOption(word: "Constituent", meaning: "構成要素")
            ],
            hint: "チームのために頑張ったり、寄付をしたりして「貢献する」こと。社会やプロジェクトに何かを「差し出す」プラスのイメージだよ。君の学習も、未来の自分への大きな貢献だね！",
            level: .intermediate
        ),
        Question(
            text: "One part of a situation, problem, or subject.",
            answer: "Aspect",
            options: [
                WordOption(word: "Aspect", meaning: "側面・局面"),
                WordOption(word: "Respect", meaning: "尊敬する・点"),
                WordOption(word: "Inspect", meaning: "検査する"),
                WordOption(word: "Expect", meaning: "期待する")
            ],
            hint: "物事や問題の「ある特定の側面（物事の一面）」を表す重要単語だよ。語源の -spect は「見る」という意味。 ad（〜の方を）+ spect（見る）から、切り取られた一面が見えるイメージだね！",
            level: .intermediate
        ),
        Question(
            text: "The person who wrote a book, article, or play.",
            answer: "Author",
            options: [
                WordOption(word: "Author", meaning: "著者・作家"),
                WordOption(word: "Actor", meaning: "俳優"),
                WordOption(word: "Artist", meaning: "芸術家"),
                WordOption(word: "Authority", meaning: "権威・当局")
            ],
            hint: "本や記事を書いた「著者（作家）」のこと。選択肢にある authority は「権威」という難しい言葉だけど、実は author から生まれた言葉なんだよ。このアプリを進めていけば、君の英語の authority（実力者）になれるからね！",
            level: .intermediate
        ),
        Question(
            text: "A prize that you get for doing something very well.",
            answer: "Award",
            options: [
                WordOption(word: "Award", meaning: "賞・賞品・（賞を）授与する"),
                WordOption(word: "Reward", meaning: "報酬・ご褒美"),
                WordOption(word: "Forward", meaning: "前方に"),
                WordOption(word: "Awkward", meaning: "気まずい・不器用な")
            ],
            hint: "アカデミー賞（Academy Awards）のようにはっきりと目に見える「賞」のこと。よく似た reward は『努力に対する個人的なご褒美（報酬）』。今の君の頑張りにも、私から特大の award をあげたいな！",
            level: .intermediate
        ),
        Question(
            text: "A person whose job is to collect and write news stories.",
            answer: "Journalist",
            options: [
                WordOption(word: "Journalist", meaning: "ジャーナリスト・記者"),
                WordOption(word: "Journal", meaning: "日誌・専門誌"),
                WordOption(word: "Journey", meaning: "旅"),
                WordOption(word: "Jurist", meaning: "法学者")
            ],
            hint: "ニュースを伝えてくれる「記者さん」のこと。以前出た journal（日誌）に、人を表す -ist がついた形だよ！",
            level: .intermediate
        ),
        Question(
            text: "The quality of being fair and right.",
            answer: "Justice",
            options: [
                WordOption(word: "Justice", meaning: "正義・公正"),
                WordOption(word: "Justify", meaning: "正当化する"),
                WordOption(word: "Judge", meaning: "裁判官"),
                WordOption(word: "Jungle", meaning: "ジャングル")
            ],
            hint: "「正義」や「公平」のこと。ヒーローが守るあの『ジャスティス』だね。正しさを大切にする、とても強い力を持つ言葉だよ。",
            level: .intermediate
        ),
        Question(
            text: "To connect someone or something in your mind with a person or thing.",
            answer: "Associate",
            options: [
                WordOption(word: "Associate", meaning: "連想する・結びつけて考える"),
                WordOption(word: "Appreciate", meaning: "感謝する・価値を認める"),
                WordOption(word: "Appropriate", meaning: "適切な"),
                WordOption(word: "Authorize", meaning: "権限を与える")
            ],
            hint: "Aを見てBを「連想する、結びつける」という意味。 'associate A with B' の形で超よく使うよ！",
            level: .intermediate
        ),
        Question(
            text: "To keep people interested and help them have a good time.",
            answer: "Entertain",
            options: [
                WordOption(word: "Entertain", meaning: "楽しませる・もてなす"),
                WordOption(word: "Maintain", meaning: "維持する"),
                WordOption(word: "Contain", meaning: "含む"),
                WordOption(word: "Obtain", meaning: "手に入れる")
            ],
            hint: "映画やショーなどで人を「楽しませる」こと。『エンターテインメント』の動詞形だね。相手を喜ばせる素敵な言葉だよ。",
            level: .intermediate
        ),
        Question(
            text: "Whole or complete, with nothing missing.",
            answer: "Entire",
            options: [
                WordOption(word: "Entire", meaning: "全体の・すべての"),
                WordOption(word: "Enter", meaning: "入る"),
                WordOption(word: "Envy", meaning: "うらやむ"),
                WordOption(word: "Retire", meaning: "引退する")
            ],
            hint: "欠けているものが何もない「全体の、すべての」という意味。 whole と同じように使える、少し丁寧な言葉だよ！",
            level: .intermediate
        ),
        Question(
            text: "Being the same in size, amount, or value.",
            answer: "Equal",
            options: [
                WordOption(word: "Equal", meaning: "等しい・平等の"),
                WordOption(word: "Equip", meaning: "備え付ける"),
                WordOption(word: "Early", meaning: "早い"),
                WordOption(word: "Eager", meaning: "熱心な")
            ],
            hint: "サイズや量が「等しい、同じ」こと。算数の『＝（イコール）』のことだね。みんなが平等（equal）である社会を目指そう！",
            level: .intermediate
        ),
        Question(
            text: "To start something that will continue for a long time, like a company or a rule.",
            answer: "Establish",
            options: [
                WordOption(word: "Establish", meaning: "設立する・確立する"),
                WordOption(word: "Publish", meaning: "出版する"),
                WordOption(word: "Abolish", meaning: "廃止する"),
                WordOption(word: "Accomplish", meaning: "成し遂げる")
            ],
            hint: "会社やルールを「設立する、つくる」こと。しっかりとした土台を築く情景の、力強い言葉だよ。",
            level: .intermediate
        ),
        Question(
            text: "To involve or require something as a necessary part.",
            answer: "Entail",
            options: [
                WordOption(word: "Entail", meaning: "〜を伴う・必要とする"),
                WordOption(word: "Detail", meaning: "詳細"),
                WordOption(word: "Curtail", meaning: "削減する"),
                WordOption(word: "Retail", meaning: "小売")
            ],
            hint: "ある事柄に必然的に「（結果として）伴う」という意味。新しい挑戦には責任が entail（伴う）ものだけど、それを乗り越える価値はあるよ！",
            level: .intermediate
        ),
        Question(
            text: "To say that something is definitely true or will happen.",
            answer: "Assert",
            options: [
                WordOption(word: "Assert", meaning: "断言する・強く主張する"),
                WordOption(word: "Insert", meaning: "挿入する"),
                WordOption(word: "Desert", meaning: "砂漠・見捨てる"),
                WordOption(word: "Exert", meaning: "（力を）使う")
            ],
            hint: "「絶対そうだ！」とはっきり「断言する」こと。自信を持って意見を言う情景だよ！",
            level: .intermediate
        ),
        Question(
            text: "To find the answer to a problem or a difficult situation.",
            answer: "Resolve",
            options: [
                WordOption(word: "Resolve", meaning: "解決する・決心する"),
                WordOption(word: "Involve", meaning: "巻き込む"),
                WordOption(word: "Evolve", meaning: "進化する"),
                WordOption(word: "Revolve", meaning: "回転する")
            ],
            hint: "問題などをしっかり「解決する」こと。新年の抱負（New Year's resolution）もこの言葉の仲間なんだ。スッキリ解決して前に進もう！",
            level: .intermediate
        ),
        Question(
            text: "To think that someone or something is important and should be treated well.",
            answer: "Respect",
            options: [
                WordOption(word: "Respect", meaning: "尊敬する・大切にする"),
                WordOption(word: "Inspect", meaning: "検査する"),
                WordOption(word: "Suspect", meaning: "疑う"),
                WordOption(word: "Aspect", meaning: "側面・外観")
            ],
            hint: "相手を素晴らしいと思って「尊敬する・敬意を払う」こと。語源は re（再び）+ spect（見る）。何度も見返したくなるような素晴らしい人、というイメージだね！",
            level: .intermediate
        ),
        Question(
            text: "To take part in an activity or event with other people.",
            answer: "Participate",
            options: [
                WordOption(word: "Participate", meaning: "参加する"),
                WordOption(word: "Anticipate", meaning: "予期する"),
                WordOption(word: "Precipitate", meaning: "引き起こす"),
                WordOption(word: "Emancipate", meaning: "解放する")
            ],
            hint: "会議やイベントに「参加する」こと。join よりも少しフォーマルな響きがあるよ。'take part in' と書き換えられることもセットで覚えちゃおう！",
            level: .intermediate
        ),
        Question(
            text: "To stop someone from talking or doing something for a short time.",
            answer: "Interrupt",
            options: [
                WordOption(word: "Interrupt", meaning: "中断させる・邪魔をする"),
                WordOption(word: "Interpret", meaning: "通訳する・解釈する"),
                WordOption(word: "Intervene", meaning: "介入する"),
                WordOption(word: "Corrupt", meaning: "汚職した・壊れた")
            ],
            hint: "話の腰を折ったり、作業を「中断させる」こと。相手の邪魔をしてしまうニュアンスがあるよ。「通訳」の interpret と綴りが似ているから注意してね！",
            level: .intermediate
        ),
        Question(
            text: "To find out a number or amount by using mathematics.",
            answer: "Calculate",
            options: [
                WordOption(word: "Calculate", meaning: "計算する・予測する"),
                WordOption(word: "Calendar", meaning: "カレンダー"),
                WordOption(word: "Circulate", meaning: "循環する"),
                WordOption(word: "Cultivate", meaning: "耕す・育てる")
            ],
            hint: "数式を使って「計算する」という意味。昔、小さな「石（calx）」を使って数を数えていたことが語源になっている、面白い歴史を持つ言葉だよ。",
            level: .intermediate
        ),
        Question(
            text: "To run after someone or something to catch them.",
            answer: "Chase",
            options: [
                WordOption(word: "Chase", meaning: "追いかける・追跡する"),
                WordOption(word: "Choose", meaning: "選ぶ"),
                WordOption(word: "Chance", meaning: "機会"),
                WordOption(word: "Cheer", meaning: "応援する")
            ],
            hint: "捕まえるために後ろから必死に「追いかける」こと。カーチェイスの『チェイス』だね！夢や目標を chase する情景にも使えるよ。",
            level: .intermediate
        ),
        Question(
            text: "To give someone the information or tools they need to do a job.",
            answer: "Equip",
            options: [
                WordOption(word: "Equip", meaning: "装備させる・備え付ける"),
                WordOption(word: "Equivalent", meaning: "同等の"),
                WordOption(word: "Equator", meaning: "赤道"),
                WordOption(word: "Equity", meaning: "公平さ")
            ],
            hint: "必要な道具や知識を「身につけさせる・装備する」こと。RPGの「そうび」も英語では Equipment。今の学習も、君の人生を豊かにする装備（Equip）だね！",
            level: .intermediate
        ),
        Question(
            text: "An open container with a handle, used for carrying liquids like water.",
            answer: "Bucket",
            options: [
                WordOption(word: "Bucket", meaning: "バケツ"),
                WordOption(word: "Ticket", meaning: "切符・チケット"),
                WordOption(word: "Pocket", meaning: "ポケット"),
                WordOption(word: "Packet", meaning: "小包")
            ],
            hint: "水などを運ぶ「バケツ」のこと。死ぬまでにやりたいことリストを 'bucket list' と言うけれど、これはバケツのユニークな英語のユーモアから来ているんだよ。",
            level: .intermediate
        ),
        Question(
            text: "A light and pleasant wind.",
            answer: "Breeze",
            options: [
                WordOption(word: "Breeze", meaning: "そよ風・簡単なこと"),
                WordOption(word: "Freeze", meaning: "凍る"),
                WordOption(word: "Bronze", meaning: "ブロンズ・青銅"),
                WordOption(word: "Braze", meaning: "ろう付けする")
            ],
            hint: "肌に心地よい「そよ風」のこと。スラングで 'It's a breeze!' と言うと、「そよ風のように簡単にできるよ！」という意味になるんだ。",
            level: .intermediate
        ),
        Question(
            text: "To keep someone or something from being harmed or lost.",
            answer: "Preserve",
            options: [
                WordOption(word: "Preserve", meaning: "保存する・保護する"),
                WordOption(word: "Observe", meaning: "観察する"),
                WordOption(word: "Reserve", meaning: "予約する"),
                WordOption(word: "Deserve", meaning: "〜に値する")
            ],
            hint: "自然や伝統などを、良い状態のまま「保存する・守る」こと。ジャムなどの「保存食」もプリザーブと言うよ。大切なものを未来へ繋ぐイメージだね。",
            level: .intermediate
        ),
        Question(
            text: "To look at something carefully to make sure it is correct or safe.",
            answer: "Check",
            options: [
                WordOption(word: "Check", meaning: "確かめる・調べる・検査"),
                WordOption(word: "Chew", meaning: "よく噛む"),
                WordOption(word: "Chess", meaning: "チェス"),
                WordOption(word: "Choke", meaning: "窒息させる")
            ],
            hint: "間違いがないか「確認する、確かめる」こと。レストランの『お会計（チェック）』も、金額を確かめることから来ているよ。",
            level: .intermediate
        ),
        Question(
            text: "Easy to see through, or having no clouds.",
            answer: "Clear",
            options: [
                WordOption(word: "Clear", meaning: "透明な・澄んだ・はっきりした"),
                WordOption(word: "Clean", meaning: "きれいな"),
                WordOption(word: "Close", meaning: "閉める・近い"),
                WordOption(word: "Clever", meaning: "利口な")
            ],
            hint: "さえぎるものがなくて「透明な、澄んでいる」状態。空がよく晴れているときや、話がはっきりしていて分かりやすいときにも使うよ！",
            level: .intermediate
        ),
        Question(
            text: "A unit for measuring temperature or angles.",
            answer: "Degree",
            options: [
                WordOption(word: "Degree", meaning: "度・学位・程度"),
                WordOption(word: "Decrease", meaning: "減少"),
                WordOption(word: "Decade", meaning: "10年間"),
                WordOption(word: "Decree", meaning: "法令")
            ],
            hint: "温度の「度」や、大学の「学位」のこと。何かのレベルや程度を表すときに使う、とっても便利な言葉だね。",
            level: .intermediate
        ),
        Question(
            text: "To take letters or packages to a person's house or office.",
            answer: "Deliver",
            options: [
                WordOption(word: "Deliver", meaning: "届ける・配達する"),
                WordOption(word: "Develop", meaning: "開発する"),
                WordOption(word: "Decline", meaning: "断る"),
                WordOption(word: "Determine", meaning: "決定する")
            ],
            hint: "荷物を「届ける」こと。出前（デリバリー）でおなじみだね。約束を果たすときにも使われるかっこいい言葉だよ！",
            level: .intermediate
        ),
        Question(
            text: "To have earned something because of your good or bad behavior.",
            answer: "Deserve",
            options: [
                WordOption(word: "Deserve", meaning: "〜に値する・ふさわしい"),
                WordOption(word: "Preserve", meaning: "保存する"),
                WordOption(word: "Reserve", meaning: "予約する"),
                WordOption(word: "Observe", meaning: "観察する")
            ],
            hint: "「〜に値する」ということ。 'You deserve it!' は、頑張った人への「当然の報いだね（おめでとう）」という最高の褒め言葉だよ！",
            level: .intermediate
        ),
        Question(
            text: "To move something from a higher place to a lower place.",
            answer: "Lower",
            options: [
                WordOption(word: "Lower", meaning: "下げる"),
                WordOption(word: "Lawyer", meaning: "弁護士"),
                WordOption(word: "Layer", meaning: "層"),
                WordOption(word: "Lover", meaning: "恋人")
            ],
            hint: "low（低い）の比較級だけど、動詞で「下げる」という意味になるよ。",
            level: .intermediate
        ),
        Question(
            text: "The state of a process, event, or factory being permanently finished.",
            answer: "Closure",
            options: [
                WordOption(word: "Closure", meaning: "閉鎖・終了・終結"),
                WordOption(word: "Enclosure", meaning: "同封物・囲い"),
                WordOption(word: "Exposure", meaning: "さらされること・暴露"),
                WordOption(word: "Pressure", meaning: "圧力")
            ],
            hint: "店や工場が完全に閉まる「閉鎖」のこと。初級で習った close（閉める）の名詞形で、物事がスッキリ『おしまい』になる情景だよ。",
            level: .intermediate
        ),
        Question(
            text: "A hard, black rock found underground that we can burn for energy.",
            answer: "Coal",
            options: [
                WordOption(word: "Coal", meaning: "石炭"),
                WordOption(word: "Coast", meaning: "海岸"),
                WordOption(word: "Goal", meaning: "目標・ゴール"),
                WordOption(word: "Coat", meaning: "コート・上着")
            ],
            hint: "燃料として燃やす黒い岩「石炭」のこと。Beginnerで解いた coast（海岸）とスペルが1文字違いだから、見間違えないようにね！",
            level: .intermediate
        ),
        Question(
            text: "A person who collects specific things as a hobby.",
            answer: "Collector",
            options: [
                WordOption(word: "Collector", meaning: "収集家・コレクター"),
                WordOption(word: "Conductor", meaning: "指揮者・車掌"),
                WordOption(word: "Calculator", meaning: "計算機"),
                WordOption(word: "Director", meaning: "監督・ディレクター")
            ],
            hint: "趣味で何かを熱心に集める「収集家」のこと。初級のサンプル問題にあった collect（集める）に -or（人）がついた形だよ！",
            level: .intermediate
        ),
        Question(
            text: "To make someone feel that they want to do something.",
            answer: "Inspire",
            options: [
                WordOption(word: "Inspire", meaning: "刺激を与える"),
                WordOption(word: "Inquire", meaning: "尋ねる"),
                WordOption(word: "Improve", meaning: "改善する"),
                WordOption(word: "Imagine", meaning: "想像する")
            ],
            hint: "誰かに「やる気」や「インスピレーション」を与えることだよ。",
            level: .intermediate
        ),
        Question(
            text: "To change a book or a movie from one language to another.",
            answer: "Translate",
            options: [
                WordOption(word: "Translate", meaning: "翻訳する"),
                WordOption(word: "Transport", meaning: "輸送する"),
                WordOption(word: "Transform", meaning: "変形させる"),
                WordOption(word: "Transmit", meaning: "送信する")
            ],
            hint: "ある言葉を別の言葉に「訳す」こと。",
            level: .intermediate
        ),
        Question(
            text: "To give a description of something or someone.",
            answer: "Describe",
            options: [
                WordOption(word: "Describe", meaning: "描写する・説明する"),
                WordOption(word: "Subscribe", meaning: "定期購読する"),
                WordOption(word: "Prescribe", meaning: "処方する"),
                WordOption(word: "Inscribe", meaning: "刻む")
            ],
            hint: "言葉で「どんな様子か」を詳しく説明すること。絵を描くように状況を伝えるイメージだよ。語尾の -scribe は「書く」という意味があるんだ。",
            level: .intermediate
        ),
        Question(
            text: "To look at something carefully to learn more about it.",
            answer: "Examine",
            options: [
                WordOption(word: "Examine", meaning: "調査する・検査する"),
                WordOption(word: "Example", meaning: "例"),
                WordOption(word: "Examinee", meaning: "受験者"),
                WordOption(word: "Imagine", meaning: "想像する")
            ],
            hint: "細部まで「調査する、検査する」こと。テスト（Examination）の語源でもあるよ。じっくり中身を調べる情景をイメージしてね。",
            level: .intermediate
        ),
        Question(
            text: "To deliberately not include something or someone.",
            answer: "Exclude",
            options: [
                WordOption(word: "Exclude", meaning: "除外する・締め出す"),
                WordOption(word: "Include", meaning: "含む"),
                WordOption(word: "Conclude", meaning: "結論づける"),
                WordOption(word: "Explode", meaning: "爆発する")
            ],
            hint: "仲間から「除外する」こと。以前出た include（含む）の反対語だよ。接頭辞の ex- は『外へ』という意味なんだ！",
            level: .intermediate
        ),
        Question(
            text: "A person who is in charge of a business or a department.",
            answer: "Manager",
            options: [
                WordOption(word: "Manager", meaning: "責任者・経営者"),
                WordOption(word: "Messenger", meaning: "使者"),
                WordOption(word: "Manufacturer", meaning: "製造業者"),
                WordOption(word: "Maintainer", meaning: "保守点検者")
            ],
            hint: "チームをまとめたり、仕事を管理（manage）する「責任者」のこと。野球部のマネージャーとは少し役割が違って、リーダー的な存在だよ。",
            level: .intermediate
        ),
        Question(
            text: "A small fact or a single part of something.",
            answer: "Detail",
            options: [
                WordOption(word: "Detail", meaning: "詳細・細部"),
                WordOption(word: "Retail", meaning: "小売"),
                WordOption(word: "Entail", meaning: "伴う"),
                WordOption(word: "Curtail", meaning: "削減する")
            ],
            hint: "「詳細」のこと。 'in detail' で「詳しく」という便利な熟語になるよ。細かい部分にまで目を向ける君の努力、素晴らしいよ！",
            level: .intermediate
        ),
        Question(
            text: "An object or machine that has been invented for a particular purpose.",
            answer: "Device",
            options: [
                WordOption(word: "Device", meaning: "装置・機器・デバイス"),
                WordOption(word: "Advice", meaning: "助言"),
                WordOption(word: "Service", meaning: "サービス"),
                WordOption(word: "Choice", meaning: "選択")
            ],
            hint: "特定の目的のための「装置」のこと。スマホも立派な電子 device だね。以前出た advice（助言）と綴りが似ているから注意！",
            level: .intermediate
        ),
        Question(
            text: "To decide that something is not important and not worth thinking about.",
            answer: "Dismiss",
            options: [
                WordOption(word: "Dismiss", meaning: "退ける・解雇する・解散させる"),
                WordOption(word: "Dislike", meaning: "嫌う"),
                WordOption(word: "Discuss", meaning: "議論する"),
                WordOption(word: "Distmiss", meaning: "ダミー") // 綴りミス誘い
            ],
            hint: "考えを「退ける」ことや、学校で「解散させる」ときに使うよ。不要なものをパッと手放す情景の言葉だね。",
            level: .intermediate
        ),
        Question(
            text: "To stop something from happening or someone from doing something.",
            answer: "Prevent",
            options: [
                WordOption(word: "Prevent", meaning: "防ぐ・妨げる"),
                WordOption(word: "Present", meaning: "提示する"),
                WordOption(word: "Predict", meaning: "予測する"),
                WordOption(word: "Preserve", meaning: "保存する")
            ],
            hint: "悪いことが起きないように「未然に防ぐ」こと。'Prevention is better than cure'（予防は治療に勝る）という素敵なことわざもあるよ！",
            level: .intermediate
        ),
        Question(
            text: "To make someone laugh or smile by being funny.",
            answer: "Amuse",
            options: [
                WordOption(word: "Amuse", meaning: "楽しませる・笑わせる"),
                WordOption(word: "Amaze", meaning: "驚かせる"),
                WordOption(word: "Abuse", meaning: "乱用する・虐待する"),
                WordOption(word: "Arrive", meaning: "到着する")
            ],
            hint: "人をクスッと「楽しませる・笑わせる」という意味だよ。『アミューズメントパーク（遊園地）』のあのアミューズだね！次の問題に出てくる amaze（驚かせる）と双子みたいに似ているから、しっかり見分けよう！",
            level: .intermediate
        ),
        Question(
            text: "The state of a process, event, or factory being permanently finished.",
            answer: "Closure",
            options: [
                WordOption(word: "Closure", meaning: "閉鎖・終了・終結"),
                WordOption(word: "Enclosure", meaning: "同封物・囲い"),
                WordOption(word: "Exposure", meaning: "さらされること・暴露"),
                WordOption(word: "Pressure", meaning: "圧力")
            ],
            hint: "店や工場が完全に閉まる「閉鎖」のこと。初級で習った close（閉める）の名詞形で、物事がスッキリ『おしまい』になる情景だよ。",
            level: .intermediate
        ),
        Question(
            text: "A hard, black rock found underground that we can burn for energy.",
            answer: "Coal",
            options: [
                WordOption(word: "Coal", meaning: "石炭"),
                WordOption(word: "Coast", meaning: "海岸"),
                WordOption(word: "Goal", meaning: "目標・ゴール"),
                WordOption(word: "Coat", meaning: "コート・上着")
            ],
            hint: "燃料として燃やす黒い岩「石炭」のこと。Beginnerで解いた coast（海岸）とスペルが1文字違いだから、見間違えないようにね！",
            level: .intermediate
        ),
        Question(
            text: "A person who collects specific things as a hobby.",
            answer: "Collector",
            options: [
                WordOption(word: "Collector", meaning: "収集家・コレクター"),
                WordOption(word: "Conductor", meaning: "指揮者・車掌"),
                WordOption(word: "Calculator", meaning: "計算機"),
                WordOption(word: "Director", meaning: "監督・ディレクター")
            ],
            hint: "趣味で何かを熱心に集める「収集家」のこと。初級のサンプル問題にあった collect（集める）に -or（人）がついた形だよ！",
            level: .intermediate
        ),
        Question(
            text: "To surprise someone very much.",
            answer: "Amaze",
            options: [
                WordOption(word: "Amaze", meaning: "驚かせる・びっくりさせる"),
                WordOption(word: "Amuse", meaning: "楽しませる"),
                WordOption(word: "Alarm", meaning: "驚かせる・警報"),
                WordOption(word: "Allow", meaning: "許可する")
            ],
            hint: "ひっくり返るくらい「驚かせる」という意味！ 'Amazing!'（すごい！）という褒め言葉でもおなじみだね。 amuse（楽しませる）とは『真ん中の文字が u か a か』のちがいだけ。もうバッチリ見分けられるね！",
            level: .intermediate
        ),
        Question(
            text: "The smallest basic unit of a living thing.",
            answer: "Cell",
            options: [
                WordOption(word: "Cell", meaning: "細胞・小さな個室・電池"),
                WordOption(word: "Call", meaning: "呼ぶ"),
                WordOption(word: "Sell", meaning: "売る"),
                WordOption(word: "Hell", meaning: "地獄")
            ],
            hint: "生物の最小単位である「細胞」のこと。元々は修道院の「小さな個室」を意味していて、そこから囚人の独房や、携帯電話（cellphone）の電波の区画（セル）にも繋がっているんだ。",
            level: .intermediate
        ),
        Question(
            text: "The way that someone or something looks on the outside.",
            answer: "Appearance",
            options: [
                WordOption(word: "Appearance", meaning: "外見・見た目・出現"),
                WordOption(word: "Appliance", meaning: "（家庭用の）器具・電化製品"),
                WordOption(word: "Assurance", meaning: "確約・保証"),
                WordOption(word: "Acceptance", meaning: "受け入れ・承認")
            ],
            hint: "人の「外見・見た目」や、パッと表に現れることを意味するよ。動詞の appear（現れる）の仲間だね。最大の罠は appliance（電化製品）！文字が1つ違うだけで『見た目』から『洗濯機や冷蔵庫』になっちゃうから要注意！",
            level: .intermediate
        ),
        Question(
            text: "To become bigger in size, number, or amount.",
            answer: "Increase",
            options: [
                WordOption(word: "Increase", meaning: "増える"),
                WordOption(word: "Decrease", meaning: "減る"),
                WordOption(word: "Release", meaning: "放す"),
                WordOption(word: "Include", meaning: "含む")
            ],
            hint: "量や数が「増える」こと。反対の decrease（減る）と一緒に覚えよう！",
            level: .intermediate
        ),
        Question(
            text: "To make or become different.",
            answer: "Alter",
            options: [
                WordOption(word: "Alter", meaning: "変える"),
                WordOption(word: "Alert", meaning: "警告する"),
                WordOption(word: "Altar", meaning: "祭壇"),
                WordOption(word: "After", meaning: "〜の後に")
            ],
            hint: "一部を「変える・修正する」という時に使われるよ。alert と綴りが似てるから注意！",
            level: .intermediate
        ),
        Question(
            text: "To give someone the help or money they need to do something.",
            answer: "Support",
            options: [
                WordOption(word: "Support", meaning: "支持する・援助する"),
                WordOption(word: "Suppose", meaning: "思う・仮定する"),
                WordOption(word: "Surprise", meaning: "驚かせる"),
                WordOption(word: "Suspend", meaning: "一時停止する")
            ],
            hint: "物理的に支えるだけでなく、経済的・精神的に「援助する」ときに使うよ。",
            level: .intermediate
        ),
        Question(
            text: "A person who is looking for a job or a place at a school.",
            answer: "Applicant",
            options: [
                WordOption(word: "Applicant", meaning: "応募者"),
                WordOption(word: "Appliance", meaning: "電化製品"),
                WordOption(word: "Assistant", meaning: "助手"),
                WordOption(word: "Appearance", meaning: "外見")
            ],
            hint: "仕事や学校に「申し込む（apply）人」のこと。",
            level: .intermediate
        ),
        Question(
            text: "To make sure that something is correct or true.",
            answer: "Confirm",
            options: [
                WordOption(word: "Confirm", meaning: "確認する"),
                WordOption(word: "Conform", meaning: "従う"),
                WordOption(word: "Comfort", meaning: "快適さ"),
                WordOption(word: "Perform", meaning: "行う")
            ],
            hint: "予約が取れているか「確認する」ときなどに使うよ。",
            level: .intermediate
        ),
        Question(
            text: "To show that something is true by using facts or information.",
            answer: "Prove",
            options: [
                WordOption(word: "Prove", meaning: "証明する"),
                WordOption(word: "Improve", meaning: "改善する"),
                WordOption(word: "Approve", meaning: "承認する"),
                WordOption(word: "Provide", meaning: "提供する")
            ],
            hint: "「ほら、本当でしょ？」と証拠を見せて「証明する」こと。",
            level: .intermediate
        ),
        Question(
            text: "To say that you are happy with someone's work or a thing.",
            answer: "Appreciate",
            options: [
                WordOption(word: "Appreciate", meaning: "感謝する・高く評価する"),
                WordOption(word: "Appropriate", meaning: "適切な"),
                WordOption(word: "Associate", meaning: "関連づける"),
                WordOption(word: "Anticipate", meaning: "予期する")
            ],
            hint: "単なる 'Thank you' よりも深く「感謝する」ときに使うビジネス頻出単語！",
            level: .intermediate
        ),
        Question(
            text: "To get someone's attention by being very good or interesting.",
            answer: "Impress",
            options: [
                WordOption(word: "Impress", meaning: "感動させる"),
                WordOption(word: "Improve", meaning: "改善する"),
                WordOption(word: "Express", meaning: "表現する"),
                WordOption(word: "Depress", meaning: "落胆させる")
            ],
            hint: "相手の心に強い「印象を与える・感動させる」こと。",
            level: .intermediate
        ),
        Question(
            text: "To give help or advice to someone as a job.",
            answer: "Consult",
            options: [
                WordOption(word: "Consult", meaning: "相談する"),
                WordOption(word: "Insult", meaning: "侮辱する"),
                WordOption(word: "Result", meaning: "結果"),
                WordOption(word: "Consent", meaning: "同意する")
            ],
            hint: "専門家にアドバイスを求めたり「相談する」こと。",
            level: .intermediate
        ),
        Question(
            text: "To grow or change into something bigger or better.",
            answer: "Develop",
            options: [
                WordOption(word: "Develop", meaning: "発達させる"),
                WordOption(word: "Deliver", meaning: "届ける"),
                WordOption(word: "Describe", meaning: "描写する"),
                WordOption(word: "Destroy", meaning: "破壊する")
            ],
            hint: "新しい技術を「開発する」とか、町が「発展する」時に使うよ。",
            level: .intermediate
        ),
        Question(
            text: "Something that people in a group or country usually do.",
            answer: "Custom",
            options: [
                WordOption(word: "Custom", meaning: "習慣・しきたり"),
                WordOption(word: "Costume", meaning: "衣装"),
                WordOption(word: "Customer", meaning: "顧客"),
                WordOption(word: "Consume", meaning: "消費する")
            ],
            hint: "その土地の「習慣」や「伝統」のこと。空港にある『税関（Customs）』も、持ち込みの習慣をチェックする場所なんだよ。",
            level: .intermediate
        ),
        Question(
            text: "Clothes that people wear to look like a different person or thing.",
            answer: "Costume",
            options: [
                WordOption(word: "Costume", meaning: "衣装・コスチューム"),
                WordOption(word: "Custom", meaning: "習慣"),
                WordOption(word: "Cosmos", meaning: "宇宙"),
                WordOption(word: "Console", meaning: "慰める")
            ],
            hint: "劇やハロウィンで着る「衣装」のこと。ひとつ前の custom（習慣）と綴りが激似だから、セットで攻略しちゃおう！",
            level: .intermediate
        ),
        Question(
            text: "An individual situation or example of something happening.",
            answer: "Case",
            options: [
                WordOption(word: "Case", meaning: "場合・事例・事件・容器"),
                WordOption(word: "Cash", meaning: "現金"),
                WordOption(word: "Cast", meaning: "投げる・配役"),
                WordOption(word: "Cause", meaning: "原因・引き起こす")
            ],
            hint: "「場合」や「事例」を表す重要単語。 'in case of ~' で「〜の場合に備えて」という、ビジネスや日常で必須の表現になるよ！",
            level: .intermediate
        ),
        Question(
            text: "To give fation to the public about a product or service.",
            answer: "Advertise",
            options: [
                WordOption(word: "Advertise", meaning: "宣伝する"),
                WordOption(word: "Advise", meaning: "助言する"),
                WordOption(word: "Advance", meaning: "進歩する"),
                WordOption(word: "Adventure", meaning: "冒険")
            ],
            hint: "テレビやネットで商品を「広告する」こと。略して ad とも言うよ。街中でよく見かける看板もこれだね！",
            level: .intermediate
        ),
        Question(
            text: "To tell someone that they should do something.",
            answer: "Recommend",
            options: [
                WordOption(word: "Recommend", meaning: "勧める"),
                WordOption(word: "Recognize", meaning: "認める"),
                WordOption(word: "Remember", meaning: "覚えている"),
                WordOption(word: "Remind", meaning: "思い出させる")
            ],
            hint: "「これいいよ！」と誰かに「勧める」こと。日本語でも「リコメンド」って言うよね。友達に教えたい時に使う言葉だよ。",
            level: .intermediate
        ),
        Question(
            text: "To make a choice to do something after thinking about it.",
            answer: "Determine",
            options: [
                WordOption(word: "Determine", meaning: "決定する・決心する"),
                WordOption(word: "Examine", meaning: "調査する"),
                WordOption(word: "Describe", meaning: "描写する"),
                WordOption(word: "Imagine", meaning: "想像する")
            ],
            hint: "事実に基づいて何かを「決定する」ことや、強く「決心する」こと。decide よりも少し硬い響きがあるよ。",
            level: .intermediate
        ),
        Question(
            text: "To let someone know about something that is happening.",
            answer: "Notify",
            options: [
                WordOption(word: "Notify", meaning: "通知する"),
                WordOption(word: "Modify", meaning: "修正する"),
                WordOption(word: "Verify", meaning: "確かめる"),
                WordOption(word: "Satisfy", meaning: "満足させる")
            ],
            hint: "公式に「知らせる、通知する」こと。スマホの「通知（notification）」はこの言葉の名詞形なんだよ。",
            level: .intermediate
        ),
        Question(
            text: "The amount of space between two places.",
            answer: "Distance",
            options: [
                WordOption(word: "Distance", meaning: "距離・遠方"),
                WordOption(word: "Distinct", meaning: "はっきりと異なる"),
                WordOption(word: "Destiny", meaning: "運命"),
                WordOption(word: "Instance", meaning: "例・場合")
            ],
            hint: "2つの地点の間の「距離」のこと。以前出た distinct（はっきり異なる）と綴りが似ているから注意してね！",
            level: .intermediate
        ),
        Question(
            text: "To show something in a public place so that people can see it.",
            answer: "Display",
            options: [
                WordOption(word: "Display", meaning: "展示する・表示する"),
                WordOption(word: "Destroy", meaning: "破壊する"),
                WordOption(word: "Describe", meaning: "描写する"),
                WordOption(word: "Deploy", meaning: "配備する")
            ],
            hint: "みんなが見えるところに「展示する」や「表示する」こと。スマホの液晶画面もディスプレイって言うよね！",
            level: .intermediate
        ),
        Question(
            text: "To get or learn something by your own effort.",
            answer: "Acquire",
            options: [
                WordOption(word: "Acquire", meaning: "（努力で）習得する・得る"),
                WordOption(word: "Require", meaning: "要求する"),
                WordOption(word: "Inquire", meaning: "尋ねる"),
                WordOption(word: "Admire", meaning: "称賛する")
            ],
            hint: "時間や努力をかけて、知識や言語、資格を「習得する」ときに使うかっこいい言葉。単に『手に入れる（get）』よりも重みがあるよ。このアプリで英語のスキルを楽しく acquire していこうね！",
            level: .intermediate
        ),
        Question(
            text: "To finish or complete something successfully after a lot of work.",
            answer: "Achieve",
            options: [
                WordOption(word: "Achieve", meaning: "成し遂げる・達成する"),
                WordOption(word: "Receive", meaning: "受け取る"),
                WordOption(word: "Deceive", meaning: "だます"),
                WordOption(word: "Believe", meaning: "信じる")
            ],
            hint: "目標や夢を「達成する」という意味。努力の末にゴールテープを切るイメージだね。名詞形は achievement（実績）。君が毎日コツコツ頑張った先には、必ず最高の achieve が待っているよ！",
            level: .intermediate
        ),
        Question(
            text: "Free from mistakes and perfectly correct in every detail.",
            answer: "Accurate",
            options: [
                WordOption(word: "Accurate", meaning: "正確な・間違いのない"),
                WordOption(word: "Absolute", meaning: "絶対的な"),
                WordOption(word: "Adequate", meaning: "十分な・適切な"),
                WordOption(word: "Accumulate", meaning: "蓄積する")
            ],
            hint: "データや時計の時間が、寸分の狂いもなく「正確な」状態のこと。correct よりも『精密さ』がアップしたニュアンスだよ！",
            level: .intermediate
        ),
        Question(
            text: "A written or spoken report that explains an event.",
            answer: "Account",
            options: [
                WordOption(word: "Account", meaning: "説明・報告・口座"),
                WordOption(word: "Amount", meaning: "量・総額"),
                WordOption(word: "Discount", meaning: "割引"),
                WordOption(word: "Counsel", meaning: "相談・助言")
            ],
            hint: "ネットの『アカウント』や銀行の『口座』でおなじみだけど、実は「説明」という意味もすごく重要！ 'on account of ~' で『〜の理由で（〜の説明に基づいて）』という重要熟語にもなるよ。",
            level: .intermediate
        ),
        Question(
            text: "To take something to a different place or position.",
            answer: "Transfer",
            options: [
                WordOption(word: "Transfer", meaning: "移す・転勤する"),
                WordOption(word: "Transport", meaning: "輸送する"),
                WordOption(word: "Transform", meaning: "変形させる"),
                WordOption(word: "Translate", meaning: "翻訳する")
            ],
            hint: "場所や部署を「移動させる」こと。電車の「乗り換え」もこの単語を使うよ。Trans（越えて）fer（運ぶ）という語源だよ。",
            level: .intermediate
        ),
        Question(
            text: "To change something to make it better or more correct.",
            answer: "Modify",
            options: [
                WordOption(word: "Modify", meaning: "修正する"),
                WordOption(word: "Notify", meaning: "通知する"),
                WordOption(word: "Magnify", meaning: "拡大する"),
                WordOption(word: "Verify", meaning: "証明する")
            ],
            hint: "計画やデザインを少し「修正する・変える」こと。完全に変えるのではなく、部分的に直すニュアンスだよ。",
            level: .intermediate
        ),
        Question(
            text: "To be enough for a purpose or a need.",
            answer: "Suffice",
            options: [
                WordOption(word: "Suffice", meaning: "十分である"),
                WordOption(word: "Surface", meaning: "表面"),
                WordOption(word: "Service", meaning: "奉仕"),
                WordOption(word: "Office", meaning: "事務所")
            ],
            hint: "「それで十分です、足ります」という意味。形容詞の sufficient（十分な）の動詞形だよ。ちょっと大人な響きの言葉だね。",
            level: .intermediate
        ),
        Question(
            text: "Living and not dead.",
            answer: "Alive",
            options: [
                WordOption(word: "Alive", meaning: "生きている"),
                WordOption(word: "Alone", meaning: "ひとりで"),
                WordOption(word: "Along", meaning: "〜に沿って"),
                WordOption(word: "Aloud", meaning: "大声で")
            ],
            hint: "「生きている」という状態を表す形容詞。Beginnerで習った alone（ひとりで）とつづりが激似だから注意！ 'Look alive!' で「シャキッとしろ！」というおもしろいフレーズもあるよ。一息入れて頑張ろう！",
            level: .intermediate
        ),
        Question(
            text: "From one end of something toward the other end.",
            answer: "Along",
            options: [
                WordOption(word: "Along", meaning: "〜に沿って"),
                WordOption(word: "Alone", meaning: "ひとりで"),
                WordOption(word: "Alive", meaning: "生きている"),
                WordOption(word: "Among", meaning: "〜の間に")
            ],
            hint: "道や川「に沿って」進むときに使うよ。これまた alone（ひとりで）とそっくりだね。 'Come along!' で「一緒においで！」という意味になる、日常会話でも大活躍の温かい単語なんだ。",
            level: .intermediate
        ),
        Question(
            text: "An opinion that someone gives you about what you should do.",
            answer: "Advice",
            options: [
                WordOption(word: "Advice", meaning: "助言・アドバイス（名詞）"),
                WordOption(word: "Advise", meaning: "助言する（動詞）"),
                WordOption(word: "Device", meaning: "装置・デバイス"),
                WordOption(word: "Admit", meaning: "認める")
            ],
            hint: "「助言（アドバイス）」という名詞だよ。実はこれ、数えられない単語（不可算名詞）だから 'an advice' とは言えないのがテストの超頻出ポイント！ 動詞の advise との「c」と「s」のちがいに気づけたかな？",
            level: .intermediate
        ),
        Question(
            text: "A person who controls or manages a bank.",
            answer: "Banker",
            options: [
                WordOption(word: "Banker", meaning: "銀行家・銀行の幹部"),
                WordOption(word: "Baker", meaning: "パン職人"),
                WordOption(word: "Barber", meaning: "理髪師"),
                WordOption(word: "Broker", meaning: "仲介人")
            ],
            hint: "銀行で働く人の中でも、特に経営に関わる「銀行家」や幹部のこと。一般の銀行員は bank clerk と言うことが多いよ。",
            level: .intermediate
        ),
        Question(
            text: "Unable to see because your eyes are damaged.",
            answer: "Blind",
            options: [
                WordOption(word: "Blind", meaning: "目の見えない・盲目の"),
                WordOption(word: "Bland", meaning: "味気ない"),
                WordOption(word: "Blend", meaning: "混ぜ合わせる"),
                WordOption(word: "Bound", meaning: "縛られた")
            ],
            hint: "「目が見えない」状態を表す形容詞だよ。窓につける『ブラインド（日よけ）』も、外の光をさえぎって見えなくするものだよね！",
            level: .intermediate
        ),
        Question(
            text: "Not having much taste, or being very simple.",
            answer: "Bland",
            options: [
                WordOption(word: "Bland", meaning: "（味などが）薄い・特徴のない"),
                WordOption(word: "Blind", meaning: "目の見えない"),
                WordOption(word: "Brand", meaning: "ブランド"),
                WordOption(word: "Bleak", meaning: "暗い・荒涼とした")
            ],
            hint: "スープなどの味が「薄くて物足りない」ときに使うよ。料理だけじゃなく、人の個性やアイデアが「退屈で面白みがない」ときにも使えます。",
            level: .intermediate
        ),
        Question(
            text: "The force of an electric current, measured in volts.",
            answer: "Voltage",
            options: [
                WordOption(word: "Voltage", meaning: "電圧"),
                WordOption(word: "Vintage", meaning: "ヴィンテージ・年代物の"),
                WordOption(word: "Voyage", meaning: "航海"),
                WordOption(word: "Storage", meaning: "貯蔵・保管")
            ],
            hint: "電気が流れる力の強さ、つまり「電圧」のこと。日本語でもボルテージが上がる、なんて言ったりするよね！",
            level: .intermediate
        ),
        Question(
            text: "A long journey, especially by ship or in space.",
            answer: "Voyage",
            options: [
                WordOption(word: "Voyage", meaning: "航海・船旅・宇宙旅行"),
                WordOption(word: "Village", meaning: "村"),
                WordOption(word: "Voltage", meaning: "電圧"),
                WordOption(word: "Usage", meaning: "使い方")
            ],
            hint: "海や宇宙への「長い旅」のこと。普通の旅行より、もっと壮大な冒険のイメージだよ。ボン・ヴォヤージュ（良い旅を）！",
            level: .intermediate
        ),
        Question(
            text: "To tell someone what they should do in a situation.",
            answer: "Advise",
            options: [
                WordOption(word: "Advise", meaning: "助言する（動詞）"),
                WordOption(word: "Advice", meaning: "助言（名詞）"),
                WordOption(word: "Advertise", meaning: "宣伝する"),
                WordOption(word: "Device", meaning: "装置")
            ],
            hint: "「助言する」という動詞だよ。名詞 advice とは双子のような関係だね。発音は「アドヴァイズ」と濁るのが特徴。文字の最後が「se」だから動詞（suruのs）と覚えるのがコツだよ！",
            level: .intermediate
        ),
        Question(
            text: "To warn someone of a danger or a problem.",
            answer: "Alert",
            options: [
                WordOption(word: "Alert", meaning: "警告する・油断のない"),
                WordOption(word: "Alter", meaning: "変える"),
                WordOption(word: "Altar", meaning: "祭壇"),
                WordOption(word: "After", meaning: "〜の後に")
            ],
            hint: "危険を知らせる「アラート（警告）」のこと。スマホの緊急通知でもおなじみだね。after などの単語とつづりがごちゃ混ぜになりやすいから、目をシャープにして見分けよう！",
            level: .intermediate
        ),
        Question(
            text: "To go away from a place, especially to start a journey.",
            answer: "Depart",
            options: [
                WordOption(word: "Depart", meaning: "出発する"),
                WordOption(word: "Report", meaning: "報告する"),
                WordOption(word: "Repeat", meaning: "繰り返す"),
                WordOption(word: "Repair", meaning: "修理する")
            ],
            hint: "旅行や移動のために「出発する」こと。空港の「出発ロビー」は departure という名詞が使われているよ。新しい旅の始まりだね！",
            level: .intermediate
        ),
        Question(
            text: "To need or use something to make a job finished.",
            answer: "Utilize",
            options: [
                WordOption(word: "Utilize", meaning: "活用する"),
                WordOption(word: "Utility", meaning: "公共料金/有用性"),
                WordOption(word: "Analyze", meaning: "分析する"),
                WordOption(word: "Realize", meaning: "気付く")
            ],
            hint: "「利用する」という意味の use を、よりフォーマルにした言葉だよ。何かを特定の目的のために「うまく使う・活用する」という情景を浮かべてみてね。",
            level: .intermediate
        ),
        Question(
            text: "To have a talk to reach an agreement.",
            answer: "Negotiate",
            options: [
                WordOption(word: "Negotiate", meaning: "交渉する"),
                WordOption(word: "Navigate", meaning: "誘導する"),
                WordOption(word: "Investigate", meaning: "調査する"),
                WordOption(word: "Calculate", meaning: "計算する")
            ],
            hint: "ビジネスや買い物で、お互いが納得いく条件を決めるために「話し合う・交渉する」こと。難しい調整を乗り越えるイメージだね。",
            level: .intermediate
        ),
        Question(
            text: "To look at two or more things to see how they are similar or different.",
            answer: "Compare",
            options: [
                WordOption(word: "Compare", meaning: "比較する・比べる"),
                WordOption(word: "Prepare", meaning: "準備する"),
                WordOption(word: "Repair", meaning: "修理する"),
                WordOption(word: "Compete", meaning: "競争する")
            ],
            hint: "2つ以上のものを「比較する、比べる」という意味。 'compare A with B' の形でよく使うよ。過去の自分と今の自分の成長を compare してみよう！",
            level: .intermediate
        ),
        Question(
            text: "An idea or a principle that is connected with something abstract.",
            answer: "Concept",
            options: [
                WordOption(word: "Concept", meaning: "概念・考え方・コンセプト"),
                WordOption(word: "Except", meaning: "〜を除いて"),
                WordOption(word: "Concert", meaning: "コンサート"),
                WordOption(word: "Decept", meaning: "だまし・欺き")
            ],
            hint: "物事の根底にある「概念、基本的な考え方」のこと。新しい商品や、このアプリのように素晴らしい「理念」を語るときに欠かせない言葉だよ。",
            level: .intermediate
        ),
        Question(
            text: "A person who stands in front of a group of musicians and directs them.",
            answer: "Conductor",
            options: [
                WordOption(word: "Conductor", meaning: "指揮者・車掌"),
                WordOption(word: "Computer", meaning: "コンピューター"),
                WordOption(word: "Collector", meaning: "収集家"),
                WordOption(word: "Director", meaning: "監督")
            ],
            hint: "オーケストラなどの「指揮者」のこと。他にも、電車の「車掌さん」や、理科の実験で電気を通す「導体」という意味もあるマルチな単語だよ！",
            level: .intermediate
        ),
        Question(
            text: "To make someone feel that they do not understand a situation clearly.",
            answer: "Confuse",
            options: [
                WordOption(word: "Confuse", meaning: "混乱させる・当惑させる"),
                WordOption(word: "Refuse", meaning: "断る"),
                WordOption(word: "Diffuse", meaning: "拡散させる"),
                WordOption(word: "Infuse", meaning: "注入する")
            ],
            hint: "頭をごちゃごちゃにして「混乱させる」という意味。 'be confused' で「パニックになる、迷う」となるよ。焦らず深呼吸して進もうね！",
            level: .intermediate
        ),
        Question(
            text: "To say something officially or publicly.",
            answer: "Declare",
            options: [
                WordOption(word: "Declare", meaning: "宣言する・申告する"),
                WordOption(word: "Decline", meaning: "断る・下落する"),
                WordOption(word: "Decide", meaning: "決定する"),
                WordOption(word: "Compare", meaning: "比較する")
            ],
            hint: "公式に「宣言する」こと。空港の税関（Customs）で荷物を「申告する」ときにもこの言葉を使うよ！",
            level: .intermediate
        ),
        Question(
            text: "To make something longer or larger in space or time.",
            answer: "Extend",
            options: [
                WordOption(word: "Extend", meaning: "延長する・広げる"),
                WordOption(word: "Expend", meaning: "費やす"),
                WordOption(word: "Expand", meaning: "拡大する"),
                WordOption(word: "Intend", meaning: "意図する")
            ],
            hint: "期限を「延長する」とか、手を「伸ばす」ときに使うよ。以前出た expand（広げる）と似ているけれど、こちらは一本の線を伸ばすイメージだよ！",
            level: .intermediate
        ),
        Question(
            text: "To let something be seen that is usually hidden.",
            answer: "Expose",
            options: [
                WordOption(word: "Expose", meaning: "さらす・露出する・暴露する"),
                WordOption(word: "Oppose", meaning: "反対する"),
                WordOption(word: "Suppose", meaning: "仮定する"),
                WordOption(word: "Impose", meaning: "課す")
            ],
            hint: "隠れていたものを外に「さらす」こと。光を当てる『露出』の意味もあるよ。秘密を暴くときや、日光に肌をさらすときに使われるね。",
            level: .intermediate
        ),
        Question(
            text: "To become less, or to make something less.",
            answer: "Decrease",
            options: [
                WordOption(word: "Decrease", meaning: "減少する・減らす"),
                WordOption(word: "Increase", meaning: "増加する"),
                WordOption(word: "Release", meaning: "解き放つ"),
                WordOption(word: "Decease", meaning: "死亡する")
            ],
            hint: "数量やレベルが「減る」こと。反対の increase（増える）とセットで覚えちゃうのが効率的だよ！",
            level: .intermediate
        ),
        Question(
            text: "To grow or make something become more successful.",
            answer: "Expand",
            options: [
                WordOption(word: "Expand", meaning: "拡大する"),
                WordOption(word: "Expend", meaning: "費やす"),
                WordOption(word: "Extend", meaning: "伸ばす"),
                WordOption(word: "Expect", meaning: "期待する")
            ],
            hint: "ビジネスの規模を大きくしたり、知識を広げたり（拡大する）するときに使うよ。風船が膨らむように外へ広がっていく情景だよ。",
            level: .intermediate
        ),
        Question(
            text: "To give your time or money to help someone or something.",
            answer: "Contribute",
            options: [
                WordOption(word: "Contribute", meaning: "貢献する"),
                WordOption(word: "Distribute", meaning: "配布する"),
                WordOption(word: "Attribute", meaning: "〜のせいにする"),
                WordOption(word: "Constituent", meaning: "構成要素")
            ],
            hint: "チームのために頑張ったり、寄付をしたりして「貢献する・寄与する」こと。社会やプロジェクトに何かを「差し出す」プラスのイメージだよ。",
            level: .intermediate
        ),
        Question(
            text: "To reach a place, especially at the end of a journey.",
            answer: "Destination",
            options: [
                WordOption(word: "Destination", meaning: "目的地"),
                WordOption(word: "Description", meaning: "描写"),
                WordOption(word: "Designation", meaning: "指定"),
                WordOption(word: "Distribution", meaning: "分配")
            ],
            hint: "旅行や移動の「目的地・行き先」のこと。ナビゲーションで最後に向かう場所だね。目標地点にたどり着いた情景を想像して！",
            level: .intermediate
        ),
        Question(
            text: "To involve or require something as a necessary part or result.",
            answer: "Entail",
            options: [
                WordOption(word: "Entail", meaning: "〜を伴う・必要とする"),
                WordOption(word: "Detail", meaning: "詳細"),
                WordOption(word: "Curtail", meaning: "削減する"),
                WordOption(word: "Retail", meaning: "小売")
            ],
            hint: "ある事柄に必然的に「（結果として）伴う」という意味。新しい仕事には責任が entail（伴う）もの。難しいけど、ビジネス文書でよく見るかっこいい言葉だよ。",
            level: .advanced
        ),
        Question(
            text: "To make something continue in the same way or at the same level.",
            answer: "Sustain",
            options: [
                WordOption(word: "Sustain", meaning: "維持する・持続させる"),
                WordOption(word: "Obtain", meaning: "手に入れる"),
                WordOption(word: "Abstain", meaning: "控える"),
                WordOption(word: "Attain", meaning: "達成する")
            ],
            hint: "SDGsの 'Sustainable' の動詞形。単にキープするだけでなく、環境や活動を「支え続ける」という深みのある言葉なんだ。君の努力も sustain していこう！",
            level: .advanced
        ),
        Question(
            text: "To think that something is likely to happen or to be true.",
            answer: "Presume",
            options: [
                WordOption(word: "Presume", meaning: "推定する・思う"),
                WordOption(word: "Resume", meaning: "再開する"),
                WordOption(word: "Consume", meaning: "消費する"),
                WordOption(word: "Assume", meaning: "想定する")
            ],
            hint: "根拠を持って「おそらくそうだろう」と推測すること。assume よりも少し確信が強い時に使うよ。大人の知的な会話に欠かせない単語だね。",
            level: .advanced
        ),
        Question(
            text: "To make a problem or a bad situation even worse.",
            answer: "Exacerbate",
            options: [
                WordOption(word: "Exacerbate", meaning: "悪化させる"),
                WordOption(word: "Exaggerate", meaning: "誇張する"),
                WordOption(word: "Exasperate", meaning: "憤慨させる"),
                WordOption(word: "Excavate", meaning: "掘り起こす")
            ],
            hint: "ただでさえ悪い状況に、さらに火に油を注いで「悪化させる」こと。綴りが似ている exaggerate（大げさに言う）と間違えやすいから気をつけて！",
            level: .advanced
        ),
        Question(
            text: "To be much better than others or to go beyond a limit.",
            answer: "Surpass",
            options: [
                WordOption(word: "Surpass", meaning: "上回る・超える"),
                WordOption(word: "Suppress", meaning: "抑える・鎮圧する"),
                WordOption(word: "Surrender", meaning: "降伏する"),
                WordOption(word: "Surplus", meaning: "余剰・黒字")
            ],
            hint: "期待や記録を「上回る」ときに使うよ。sur（上に）pass（通る）という語源を知っていると覚えやすいね。君の昨日の自分を surpass していこう！",
            level: .advanced
        ),
        Question(
            text: "To clear someone from blame or to prove they are not guilty.",
            answer: "Exonerate",
            options: [
                WordOption(word: "Exonerate", meaning: "無罪とする・身の潔白を証明する"),
                WordOption(word: "Exhilarate", meaning: "元気づける"),
                WordOption(word: "Exaggerate", meaning: "誇張する"),
                WordOption(word: "Exterminate", meaning: "根絶させる")
            ],
            hint: "疑われていた人の「潔白を証明する」という少し難しい言葉。ニュースや裁判のシーンでよく出てくるよ。重荷（onus）から外（ex）に出してあげるイメージだね。",
            level: .advanced
        ),
        Question(
            text: "To stop something from happening or to make it impossible.",
            answer: "Preclude",
            options: [
                WordOption(word: "Preclude", meaning: "排除する・妨げる"),
                WordOption(word: "Exclude", meaning: "除外する"),
                WordOption(word: "Include", meaning: "含む"),
                WordOption(word: "Conclude", meaning: "結論づける")
            ],
            hint: "あらかじめ（pre）閉ざして（clude）「起こり得ないようにする」こと。exclude（仲間外れにする）と似ているけど、こちらは「可能性を断つ」ニュアンスが強いよ。",
            level: .advanced
        ),
        Question(
            text: "A lack of something that is necessary or needed.",
            answer: "Deficiency",
            options: [
                WordOption(word: "Deficiency", meaning: "不足・欠乏"),
                WordOption(word: "Efficiency", meaning: "効率"),
                WordOption(word: "Sufficiency", meaning: "十分なこと"),
                WordOption(word: "Proficiency", meaning: "熟達・堪能")
            ],
            hint: "ビタミン不足や能力の欠如など、必要なものが「足りない」状態のこと。効率（efficiency）を求めるあまり、休息が deficiency にならないようにね！",
            level: .advanced
        ),
        Question(
            text: "To change back and forth between different levels or amounts.",
            answer: "Fluctuate",
            options: [
                WordOption(word: "Fluctuate", meaning: "変動する"),
                WordOption(word: "Frustrate", meaning: "挫折させる"),
                WordOption(word: "Fascinate", meaning: "魅了する"),
                WordOption(word: "Formulate", meaning: "明確に述べる")
            ],
            hint: "価格や気温が、波のように上がったり下がったり「変動する」こと。語源の flu（流れる）は fluid（液体）と同じ仲間だよ。不安定な動きをイメージしてみて。",
            level: .advanced
        ),
        Question(
            text: "To represent or be a very good example of something.",
            answer: "Embody",
            options: [
                WordOption(word: "Embody", meaning: "具現化する・体現する"),
                WordOption(word: "Embrace", meaning: "抱きしめる・受け入れる"),
                WordOption(word: "Empower", meaning: "権限を与える"),
                WordOption(word: "Embark", meaning: "乗り出す・着手する")
            ],
            hint: "考えや精神を、具体的な「形（body）」にして表すこと。このアプリは、あなたの「英語を学びたい」という情熱を embody した存在でありたいと思っています！",
            level: .advanced
        ),
        Question(
            text: "To give up a high position, such as being a king or queen.",
            answer: "Abdicate",
            options: [
                WordOption(word: "Abdicate", meaning: "（王位などを）退く"),
                WordOption(word: "Advocate", meaning: "提唱する・支持する"),
                WordOption(word: "Abduct", meaning: "誘拐する"),
                WordOption(word: "Indicate", meaning: "示す")
            ],
            hint: "王様や女王様がその地位を「退位する」ときに使う言葉。ab（離れて）+ dicate（宣言する）という語源だよ。歴史のニュースなどで耳にする高尚な響きだね。",
            level: .advanced
        ),
        Question(
            text: "To clear someone from a charge of doing something wrong.",
            answer: "Acquit",
            options: [
                WordOption(word: "Acquit", meaning: "無罪にする"),
                WordOption(word: "Acquire", meaning: "習得する"),
                WordOption(word: "Admit", meaning: "認める"),
                WordOption(word: "Quit", meaning: "辞める")
            ],
            hint: "裁判などで「無罪を言い渡す」こと。容疑を quit（去らせる）させるイメージだね。反対に guilty（有罪）と言われないように、身の潔白を証明できた状態だよ。",
            level: .advanced
        ),
        Question(
            text: "To collect or gather something over a period of time.",
            answer: "Accumulate",
            options: [
                WordOption(word: "Accumulate", meaning: "蓄積する"),
                WordOption(word: "Accommodate", meaning: "収容する・適応させる"),
                WordOption(word: "Accurate", meaning: "正確な"),
                WordOption(word: "Calculate", meaning: "計算する")
            ],
            hint: "お金や知識、雪などが少しずつ「積み重なる」こと。ポイントカードのポイントが貯まるのもこれ！日々の小さな努力が accumulate して、大きな力になるんだよ。",
            level: .advanced
        ),
        Question(
            text: "To say that someone has done something wrong without proof.",
            answer: "Allege",
            options: [
                WordOption(word: "Allege", meaning: "（証拠なしに）主張する"),
                WordOption(word: "Allure", meaning: "魅了する"),
                WordOption(word: "Alleviate", meaning: "（痛みを）和らげる"),
                WordOption(word: "Legend", meaning: "伝説")
            ],
            hint: "証拠はまだないけれど「〜だと主張する」こと。ニュースで 'allegedly'（伝えられるところによると）という形でよく使われるよ。断定を避ける大人の表現だね。",
            level: .advanced
        ),
        Question(
            text: "To make something less painful or difficult to deal with.",
            answer: "Alleviate",
            options: [
                WordOption(word: "Alleviate", meaning: "軽減する・和らげる"),
                WordOption(word: "Elevate", meaning: "高める"),
                WordOption(word: "Abbreviate", meaning: "短縮する"),
                WordOption(word: "Eliminate", meaning: "取り除く")
            ],
            hint: "苦痛や渋滞、問題などを「軽くする」こと。elevator（エレベーター）と同じく 'lev'（軽く持ち上げる）という仲間なんだ。君の不安を少しでも alleviate できますように！",
            level: .advanced
        ),
        Question(
            text: "To be much more than enough or very common.",
            answer: "Abound",
            options: [
                WordOption(word: "Abound", meaning: "豊富にある"),
                WordOption(word: "Around", meaning: "周りに"),
                WordOption(word: "Abandon", meaning: "捨てる"),
                WordOption(word: "Bound", meaning: "縛られた・〜行きの")
            ],
            hint: "「たくさん存在する」という意味。'Fish abound in this river.'（この川には魚が豊富だ）のように使うよ。abundant（豊富な）という形容詞と一緒にセットで覚えよう！",
            level: .advanced
        ),
        Question(
            text: "Certain to happen, or forced to go to a particular place.",
            answer: "Bound",
            options: [
                WordOption(word: "Bound", meaning: "きっと〜する・〜行きの"),
                WordOption(word: "Found", meaning: "見つけた・設立する"),
                WordOption(word: "Round", meaning: "丸い"),
                WordOption(word: "Sound", meaning: "音・健全な")
            ],
            hint: " 'be bound to ~' で「きっと〜する」という強い確信を表すよ。電車の「〜方面行き（Tokyo-bound）」でもおなじみだね！",
            level: .advanced
        ),
        Question(
            text: "A person who helps people buy and sell things, like houses or stocks.",
            answer: "Broker",
            options: [
                WordOption(word: "Broker", meaning: "仲介人・ブローカー"),
                WordOption(word: "Baker", meaning: "パン職人"),
                WordOption(word: "Barber", meaning: "理髪師"),
                WordOption(word: "Buyer", meaning: "買い手")
            ],
            hint: "ビジネスの間に入って取引を手伝う「仲介人」のこと。Beginnerで登場した buyer（買い手）をサポートするお仕事だね！",
            level: .advanced
        ),
        Question(
            text: "To not follow a rule, a promise, or a law.",
            answer: "Break",
            options: [
                WordOption(word: "Break", meaning: "（法律などに）違反する・破る"),
                WordOption(word: "Bleed", meaning: "出血する"),
                WordOption(word: "Breathe", meaning: "呼吸する"),
                WordOption(word: "Bake", meaning: "焼く")
            ],
            hint: "ルールや約束を「破る（違反する）」という意味の重要な使い方。形のあるものだけじゃなく、目に見えないルールを壊すときにも大活躍するよ！",
            level: .advanced
        ),
        Question(
            text: "To change or adjust something to make it work better.",
            answer: "Modify",
            options: [
                WordOption(word: "Modify", meaning: "修正する"),
                WordOption(word: "Identify", meaning: "特定する"),
                WordOption(word: "Magnify", meaning: "拡大する"),
                WordOption(word: "Justify", meaning: "正当化する")
            ],
            hint: "計画やデザインを「部分的に修正する」こと。完全に変えるのではなく、もっと良くするために「微調整する」ニュアンスだよ。ゲームの「MOD」もここから来ているんだ。",
            level: .advanced
        ),
        Question(
            text: "To help or encourage something to happen or develop.",
            answer: "Promote",
            options: [
                WordOption(word: "Promote", meaning: "促進する・昇進させる"),
                WordOption(word: "Remote", meaning: "遠い"),
                WordOption(word: "Prohibit", meaning: "禁止する"),
                WordOption(word: "Provide", meaning: "提供する")
            ],
            hint: "物事を前に（pro）動かす（mote）から、販売を「促進する」や「昇進させる」という意味になるよ。反対に、後ろに動くのが demote（降格させる）だよ。",
            level: .advanced
        ),
        Question(
            text: "To get or receive something, especially by effort.",
            answer: "Obtain",
            options: [
                WordOption(word: "Obtain", meaning: "得る・手に入れる"),
                WordOption(word: "Contain", meaning: "含む"),
                WordOption(word: "Retain", meaning: "保持する"),
                WordOption(word: "Sustain", meaning: "維持する")
            ],
            hint: "努力して何かを「手に入れる」こと。get よりもフォーマルな言葉だよ。資格や許可を「取得する」ときによく使われるね。君もこのアプリで自信を obtain しよう！",
            level: .advanced
        ),
        Question(
            text: "To find out the exact size, amount, or value of something.",
            answer: "Gauge",
            options: [
                WordOption(word: "Gauge", meaning: "測定する・判断する"),
                WordOption(word: "Garage", meaning: "車庫"),
                WordOption(word: "Guide", meaning: "案内する"),
                WordOption(word: "Gorge", meaning: "峡谷")
            ],
            hint: "器具を使って「測る」こと。また、人の反応を「探る・判断する」ときにも使うよ。車のスピードメーターなども gauge の一種。発音は「ゲージ」だよ、綴りに注意！",
            level: .advanced
        ),
        Question(
            text: "To give someone the information or tools they need to do a job.",
            answer: "Equip",
            options: [
                WordOption(word: "Equip", meaning: "装備させる・備える"),
                WordOption(word: "Equivalent", meaning: "同等の"),
                WordOption(word: "Equity", meaning: "公平・資産"),
                WordOption(word: "Equal", meaning: "等しい")
            ],
            hint: "必要な知識や道具を「身につけさせる」こと。RPGの装備もこの言葉だよ。君の学習も、未来を切り拓くための強力な equip だね！",
            level: .advanced
        ),
        Question(
            text: "To clear someone from a charge of doing something wrong.",
            answer: "Acquit",
            options: [
                WordOption(word: "Acquit", meaning: "無罪にする"),
                WordOption(word: "Acquire", meaning: "習得する"),
                WordOption(word: "Admit", meaning: "認める"),
                WordOption(word: "Require", meaning: "必要とする")
            ],
            hint: "裁判などで「無罪を言い渡す」こと。容疑を quit（去らせる）させるイメージだね。acquire（手に入れる）と綴りが似ているから注意して！",
            level: .advanced
        ),
        Question(
            text: "To change back and forth between different levels or amounts.",
            answer: "Fluctuate",
            options: [
                WordOption(word: "Fluctuate", meaning: "（価格などが）変動する"),
                WordOption(word: "Frustrate", meaning: "挫折させる"),
                WordOption(word: "Fascinate", meaning: "魅了する"),
                WordOption(word: "Formulate", meaning: "明確に述べる")
            ],
            hint: "価格や気温が、波のように上がったり下がったり「変動する」こと。語源の flu は「流れる」を意味し、fluid（流動体）の仲間なんだよ。不安定な動きをイメージして！",
            level: .advanced
        ),
        Question(
            text: "To make a problem or a bad situation even worse.",
            answer: "Exacerbate",
            options: [
                WordOption(word: "Exacerbate", meaning: "悪化させる"),
                WordOption(word: "Exaggerate", meaning: "誇張する"),
                WordOption(word: "Exasperate", meaning: "憤慨させる"),
                WordOption(word: "Excavate", meaning: "掘り起こす")
            ],
            hint: "悪い状況にさらに火に油を注いで「悪化させる」こと。綴りが似ている exaggerate（大げさに言う）と間違えやすいから気をつけて！",
            level: .advanced
        ),
        Question(
            text: "To reach a place, especially at the end of a journey.",
            answer: "Destination",
            options: [
                WordOption(word: "Destination", meaning: "目的地"),
                WordOption(word: "Description", meaning: "描写"),
                WordOption(word: "Designation", meaning: "指定"),
                WordOption(word: "Distribution", meaning: "分配")
            ],
            hint: "旅の最後に向かう「目的地・行き先」のこと。ナビゲーションで見かける言葉だね。目標地点にたどり着いた時の達成感を想像して！",
            level: .advanced
        ),
        Question(
            text: "To clear someone from blame or to prove they are not guilty.",
            answer: "Exonerate",
            options: [
                WordOption(word: "Exonerate", meaning: "無罪とする・身の潔白を証明する"),
                WordOption(word: "Exhilarate", meaning: "元気づける"),
                WordOption(word: "Exaggerate", meaning: "誇張する"),
                WordOption(word: "Exterminate", meaning: "根絶させる")
            ],
            hint: "疑われていた人の「潔白を証明する」という少し難しい言葉。重荷（onus）から外（ex）に出してあげるイメージだね。ニュースや裁判のシーンでよく出てくるよ。",
            level: .advanced
        ),
        Question(
            text: "To represent or be a very good example of something.",
            answer: "Embody",
            options: [
                WordOption(word: "Embody", meaning: "具現化する・体現する"),
                WordOption(word: "Embrace", meaning: "抱きしめる・受け入れる"),
                WordOption(word: "Empower", meaning: "権限を与える"),
                WordOption(word: "Embark", meaning: "乗り出す")
            ],
            hint: "考えや精神を、具体的な「形（body）」にして表すこと。このアプリは、あなたの「成長したい」という情熱を embody した存在でありたいと思っています！",
            level: .advanced
        ),
        Question(
            text: "To think that something is likely to happen or to be true.",
            answer: "Presume",
            options: [
                WordOption(word: "Presume", meaning: "推定する・思う"),
                WordOption(word: "Resume", meaning: "再開する"),
                WordOption(word: "Consume", meaning: "消費する"),
                WordOption(word: "Assume", meaning: "想定する")
            ],
            hint: "根拠を持って「おそらくそうだろう」と推測すること。assume よりも少し確信が強い時に使うよ。大人の知的な会話に欠かせない単語だね。",
            level: .advanced
        ),
        Question(
            text: "A lack of something that is necessary or needed.",
            answer: "Deficiency",
            options: [
                WordOption(word: "Deficiency", meaning: "不足・欠乏"),
                WordOption(word: "Efficiency", meaning: "効率"),
                WordOption(word: "Sufficiency", meaning: "十分なこと"),
                WordOption(word: "Proficiency", meaning: "熟達")
            ],
            hint: "ビタミン不足や能力の欠如など、必要なものが「足りない」状態のこと。効率（efficiency）を求めるあまり、休息が deficiency にならないようにね！",
            level: .advanced
        ),
        Question(
            text: "To make music with your voice.",
            answer: "Sing",
            options: [
                WordOption(word: "Sing", meaning: "歌う"),
                WordOption(word: "Song", meaning: "歌"),
                WordOption(word: "Sink", meaning: "沈む"),
                WordOption(word: "Sign", meaning: "署名")
            ],
            hint: "メロディに合わせて「歌う」こと。簡単な単語だけど、綴りが似ている sign（署名）や sink（沈む）と見間違えないように、基本を大切にしよう！",
            level: .advanced
        ),
        Question(
            text: "To show clearly that something exists or is true.",
            answer: "Manifest",
            options: [
                WordOption(word: "Manifest", meaning: "明らかにする・表す"),
                WordOption(word: "Maintain", meaning: "維持する"),
                WordOption(word: "Manufacture", meaning: "製造する"),
                WordOption(word: "Magnify", meaning: "拡大する")
            ],
            hint: "感情や兆候がはっきりと「表れる」こと。マニフェスト（宣言）の語源だよ。内に秘めたものが外に見えるようになる情景をイメージして！",
            level: .advanced
        ),
        Question(
            text: "To study something carefully to understand it by breaking it into parts.",
            answer: "Analyze",
            options: [
                WordOption(word: "Analyze", meaning: "分析する"),
                WordOption(word: "Apologize", meaning: "謝罪する"),
                WordOption(word: "Advertise", meaning: "宣伝する"),
                WordOption(word: "Anesthetize", meaning: "麻酔をかける")
            ],
            hint: "複雑なデータや状況を細かく分けて「分析する」という意味だよ。ビジネスや科学のニュースで大活躍する大人の単語だね。語尾が -lize / -gize / -tise で終わる『つづり長めチーム』に惑わされずに選べたかな？",
            level: .advanced
        ),
        Question(
            text: "To imagine or expect that something will happen in the future.",
            answer: "Anticipate",
            options: [
                WordOption(word: "Anticipate", meaning: "予期する・楽しみに待つ"),
                WordOption(word: "Participate", meaning: "参加する"),
                WordOption(word: "Appreciate", meaning: "感謝する・高く評価する"),
                WordOption(word: "Accelerate", meaning: "加速する")
            ],
            hint: "未来のことを「予期する」や「ワクワクして待つ」という意味。間違い選択肢の participate（参加する）と語尾が全く同じだから、受験生が本当によくパニックになる単語なんだ。前（anti-）を向いてキャッチ（cip）する、と覚えよう！",
            level: .advanced
        ),
        Question(
            text: "Correct or suitable for a particular situation or purpose.",
            answer: "Appropriate",
            options: [
                WordOption(word: "Appropriate", meaning: "適切な・ふさわしい"),
                WordOption(word: "Appreciate", meaning: "感謝する"),
                WordOption(word: "Approximate", meaning: "おおよその"),
                WordOption(word: "Approve", meaning: "承認する")
            ],
            hint: "その場にぴったり「適切な・ふさわしい」という意味の形容詞。TPOに合っているイメージだね。つづりが激似の appreciate（感謝する）や approximate（おおよその）が並ぶと目がチカチカするけれど、見破れた君の集中力は本物だよ！",
            level: .advanced
        ),
        Question(
            text: "To say that something will happen in the future.",
            answer: "Predict",
            options: [
                WordOption(word: "Predict", meaning: "予測する・予言する"),
                WordOption(word: "Contradict", meaning: "矛盾する"),
                WordOption(word: "Verdict", meaning: "判決"),
                WordOption(word: "Indict", meaning: "起訴する")
            ],
            hint: "pre（前もって）+ dict（言う）から「予測する」。占い師や天気予報のイメージだね。反対に contra（反対を）dict（言う）なら「矛盾する」になるんだよ。面白いよね！",
            level: .advanced
        ),
        Question(
            text: "To give your power or a job to someone else.",
            answer: "Delegate",
            options: [
                WordOption(word: "Delegate", meaning: "委任する・代表として送る"),
                WordOption(word: "Dedicate", meaning: "捧げる"),
                WordOption(word: "Delicate", meaning: "繊細な"),
                WordOption(word: "Deviate", meaning: "それる")
            ],
            hint: "自分ひとりで抱え込まず、信頼して仕事を「任せる」こと。デリケート（delicate）と綴りが似ているけど、リーダーには欠かせない能力（delegate）だよ！",
            level: .advanced
        ),
        Question(
            text: "To keep something in your mind or to continue to have it.",
            answer: "Retain",
            options: [
                WordOption(word: "Retain", meaning: "保持する・覚えている"),
                WordOption(word: "Detain", meaning: "拘留する"),
                WordOption(word: "Attain", meaning: "達成する"),
                WordOption(word: "Abstain", meaning: "控える")
            ],
            hint: "知識や権利などを「持ち続ける」こと。re（後ろに）+ tain（つかむ）から来ているよ。覚えた英単語をしっかり脳内に retain していこうね！",
            level: .advanced
        ),
        Question(
            text: "To find out the exact size, amount, or value of something.",
            answer: "Measure",
            options: [
                WordOption(word: "Measure", meaning: "測定する・評価する"),
                WordOption(word: "Leisure", meaning: "余暇"),
                WordOption(word: "Treasure", meaning: "宝物"),
                WordOption(word: "Closure", meaning: "閉鎖")
            ],
            hint: "長さや重さを「測る」こと。それだけじゃなく、価値を「判断する」ときにも使うよ。綴りが似ている treasure（宝物）を測るイメージで覚えるのはどうかな？",
            level: .advanced
        ),
        Question(
            text: "To grow or change into something better or more successful.",
            answer: "Thrive",
            options: [
                WordOption(word: "Thrive", meaning: "繁栄する・うまくいく"),
                WordOption(word: "Strive", meaning: "努力する"),
                WordOption(word: "Deprive", meaning: "奪う"),
                WordOption(word: "Derive", meaning: "引き出す")
            ],
            hint: "ビジネスや植物が「生き生きと成長する」こと。strive（努力する）した結果、thrive（繁栄する）という流れで覚えると、やる気が出てこない？",
            level: .advanced
        ),
        Question(
            text: "To make something less painful or difficult to deal with.",
            answer: "Relieve",
            options: [
                WordOption(word: "Relieve", meaning: "和らげる・安心させる"),
                WordOption(word: "Believe", meaning: "信じる"),
                WordOption(word: "Retrieve", meaning: "取り戻す"),
                WordOption(word: "Deceive", meaning: "だます")
            ],
            hint: "痛みや不安を「軽くする」こと。'I'm relieved.'（安心したよ）という表現でよく使うね。君の学習の疲れも、このヒントで少し relieve されるといいな！",
            level: .advanced
        ),
        Question(
            text: "To happen at the same time as something else.",
            answer: "Coincide",
            options: [
                WordOption(word: "Coincide", meaning: "同時に起こる・一致する"),
                WordOption(word: "Collide", meaning: "衝突する"),
                WordOption(word: "Confide", meaning: "信頼して打ち明ける"),
                WordOption(word: "Consider", meaning: "検討する")
            ],
            hint: "予定や意見が「ぴったり重なる」こと。co（共に）+ incide（起こる）。偶然の一致（coincidence）もこの仲間だよ。Collide（衝突する）とは正反対のイメージだね。",
            level: .advanced
        ),
        Question(
            text: "To collect a large amount of something over time.",
            answer: "Amass",
            options: [
                WordOption(word: "Amass", meaning: "蓄積する・貯める"),
                WordOption(word: "Amaze", meaning: "驚かせる"),
                WordOption(word: "Assess", meaning: "評価する"),
                WordOption(word: "Amuse", meaning: "楽しませる")
            ],
            hint: "富や情報などを「コツコツと貯める」こと。Mass（かたまり）に A（〜へ）するイメージだね。一歩ずつの学習が、大きな知識を amass していくよ！",
            level: .advanced
        ),
        Question(
            text: "To represent something or be a perfect example of it.",
            answer: "Embody",
            options: [
                WordOption(word: "Embody", meaning: "具現化する・体現する"),
                WordOption(word: "Embark", meaning: "乗り出す"),
                WordOption(word: "Embrace", meaning: "抱きしめる"),
                WordOption(word: "Empower", meaning: "権限を与える")
            ],
            hint: "考えや精神を、具体的な「形（body）」にして表すこと。このアプリは、あなたの「成長したい」という情熱を embody した存在でありたいと思っています！",
            level: .advanced
        ),
        Question(
            text: "To give someone the information or tools they need to do a job.",
            answer: "Equip",
            options: [
                WordOption(word: "Equip", meaning: "装備させる・備える"),
                WordOption(word: "Equivalent", meaning: "同等の"),
                WordOption(word: "Equity", meaning: "公平・資産"),
                WordOption(word: "Equal", meaning: "等しい")
            ],
            hint: "必要な知識や道具を「身につけさせる」こと。RPGの装備もこの言葉だよ。君の学習も、未来を切り拓くための強力な equip だね！",
            level: .advanced
        ),
        Question(
            text: "To clear someone from a charge of doing something wrong.",
            answer: "Acquit",
            options: [
                WordOption(word: "Acquit", meaning: "無罪にする"),
                WordOption(word: "Acquire", meaning: "習得する"),
                WordOption(word: "Admit", meaning: "認める"),
                WordOption(word: "Require", meaning: "必要とする")
            ],
            hint: "裁判などで「無罪を言い渡す」こと。容疑を quit（去らせる）させるイメージだね。acquire（手に入れる）と綴りが似ているから注意して！",
            level: .advanced
        ),
        Question(
            text: "To change back and forth between different levels or amounts.",
            answer: "Fluctuate",
            options: [
                WordOption(word: "Fluctuate", meaning: "（価格などが）変動する"),
                WordOption(word: "Frustrate", meaning: "挫折させる"),
                WordOption(word: "Fascinate", meaning: "魅了する"),
                WordOption(word: "Formulate", meaning: "明確に述べる")
            ],
            hint: "価格や気温が、波のように上がったり下がったり「変動する」こと。語源の flu は「流れる」を意味し、fluid（流動体）の仲間なんだよ。不安定な動きをイメージして！",
            level: .advanced
        ),
        Question(
            text: "To make a problem or a bad situation even worse.",
            answer: "Exacerbate",
            options: [
                WordOption(word: "Exacerbate", meaning: "悪化させる"),
                WordOption(word: "Exaggerate", meaning: "誇張する"),
                WordOption(word: "Exasperate", meaning: "憤慨させる"),
                WordOption(word: "Excavate", meaning: "掘り起こす")
            ],
            hint: "悪い状況にさらに火に油を注いで「悪化させる」こと。綴りが似ている exaggerate（大げさに言う）と間違えやすいから気をつけて！",
            level: .advanced
        ),
        Question(
            text: "To reach a place, especially at the end of a journey.",
            answer: "Destination",
            options: [
                WordOption(word: "Destination", meaning: "目的地"),
                WordOption(word: "Description", meaning: "描写"),
                WordOption(word: "Designation", meaning: "指定"),
                WordOption(word: "Distribution", meaning: "分配")
            ],
            hint: "旅の最後に向かう「目的地・行き先」のこと。ナビゲーションで見かける言葉だね。目標地点にたどり着いた時の達成感を想像して！",
            level: .advanced
        ),
        Question(
            text: "To clear someone from blame or to prove they are not guilty.",
            answer: "Exonerate",
            options: [
                WordOption(word: "Exonerate", meaning: "無罪とする・身の潔白を証明する"),
                WordOption(word: "Exhilarate", meaning: "元気づける"),
                WordOption(word: "Exaggerate", meaning: "誇張する"),
                WordOption(word: "Exterminate", meaning: "根絶させる")
            ],
            hint: "疑われていた人の「潔白を証明する」という少し難しい言葉。重荷（onus）から外（ex）に出してあげるイメージだね。ニュースや裁判のシーンでよく出てくるよ。",
            level: .advanced
        ),
        Question(
            text: "To represent or be a very good example of something.",
            answer: "Embody",
            options: [
                WordOption(word: "Embody", meaning: "具現化する・体現する"),
                WordOption(word: "Embrace", meaning: "抱きしめる・受け入れる"),
                WordOption(word: "Empower", meaning: "権限を与える"),
                WordOption(word: "Embark", meaning: "乗り出す")
            ],
            hint: "考えや精神を、具体的な「形（body）」にして表すこと。このアプリは、あなたの「成長したい」という情熱を embody した存在でありたいと思っています！",
            level: .advanced
        ),
        Question(
            text: "To think that something is likely to happen or to be true.",
            answer: "Presume",
            options: [
                WordOption(word: "Presume", meaning: "推定する・思う"),
                WordOption(word: "Resume", meaning: "再開する"),
                WordOption(word: "Consume", meaning: "消費する"),
                WordOption(word: "Assume", meaning: "想定する")
            ],
            hint: "根拠を持って「おそらくそうだろう」と推測すること。assume よりも少し確信が強い時に使うよ。大人の知的な会話に欠かせない単語だね。",
            level: .advanced
        ),
        Question(
            text: "A lack of something that is necessary or needed.",
            answer: "Deficiency",
            options: [
                WordOption(word: "Deficiency", meaning: "不足・欠乏"),
                WordOption(word: "Efficiency", meaning: "効率"),
                WordOption(word: "Sufficiency", meaning: "十分なこと"),
                WordOption(word: "Proficiency", meaning: "熟達")
            ],
            hint: "ビタミン不足や能力の欠如など、必要なものが「足りない」状態のこと。効率（efficiency）を求めるあまり、休息が deficiency にならないようにね！",
            level: .advanced
        ),
        Question(
            text: "To make music with your voice.",
            answer: "Sing",
            options: [
                WordOption(word: "Sing", meaning: "歌う"),
                WordOption(word: "Song", meaning: "歌"),
                WordOption(word: "Sink", meaning: "沈む"),
                WordOption(word: "Sign", meaning: "署名")
            ],
            hint: "メロディに合わせて「歌う」こと。簡単な単語だけど、綴りが似ている sign（署名）や sink（沈む）と見間違えないように、基本を大切にしよう！",
            level: .advanced
        ),
        Question(
            text: "To leave someone or something forever, especially when you should stay.",
            answer: "Abandon",
            options: [
                WordOption(word: "Abandon", meaning: "捨てる・あきらめる"),
                WordOption(word: "Abound", meaning: "豊富にある"),
                WordOption(word: "Abundant", meaning: "豊富な"),
                WordOption(word: "Absorb", meaning: "吸収する")
            ],
            hint: "途中で責任を放り出して「見捨てる」や、計画を「あきらめる」という少し悲しいニュアンスの言葉。でも、このアプリでの学習は絶対に abandon させないから安心してね。一緒に最後まで並走しよう！",
            level: .advanced
        ),
        Question(
            text: "To provide a place for someone to stay or sleep.",
            answer: "Accommodate",
            options: [
                WordOption(word: "Accommodate", meaning: "収容する・宿泊させる"),
                WordOption(word: "Accumulate", meaning: "蓄積する"),
                WordOption(word: "Accomplish", meaning: "成し遂げる"),
                WordOption(word: "Accompany", meaning: "同行する")
            ],
            hint: "ホテルや施設が、乗客や宿泊客を「収容する」という意味の、TOEIC超重要単語！名詞形の accommodation（宿泊施設）も旅の予約で絶対に見かけるよ。cが2つ、mが2つあるスペルにも注目！",
            level: .advanced
        ),
        Question(
            text: "To choose not to do something that you enjoy, especially for health reasons.",
            answer: "Abstain",
            options: [
                WordOption(word: "Abstain", meaning: "（お酒や投票を）控える・棄権する"),
                WordOption(word: "Abstain", meaning: "控える・棄権する"), // ダミー用：実際は異なるスペルを配置
                WordOption(word: "Attain", meaning: "達成する"),
                WordOption(word: "Obtain", meaning: "手に入れる"),
                WordOption(word: "Retain", meaning: "保持する")
            ],
            hint: "大好きなものを健康などのためにグッと「控える（禁欲する）」こと。『お酒を控える』などでよく使うよ。語尾の -tain は『つかむ』。abs-（離れて）+ tain（つかむ）で『距離を置く』イメージだね！",
            level: .advanced
        ),
        Question(
            text: "To agree that something is true, especially when you do not want to.",
            answer: "Admit",
            options: [
                WordOption(word: "Admit", meaning: "（しぶしぶ）認める・入場を許す"),
                WordOption(word: "Administer", meaning: "管理する・運営する"),
                WordOption(word: "Adopt", meaning: "採用する"),
                WordOption(word: "Advice", meaning: "助言")
            ],
            hint: "本当は言いたくないけれど「（しぶしぶ）認める」という、ちょっと人間くさいニュアンスを持つ単語。大学入試やビジネス英語の超重要語だよ。間違えやすい administer と一緒にかっこよく覚えちゃおう！",
            level: .advanced
        ),
        Question(
            text: "To move forward or to make progress in something.",
            answer: "Advance",
            options: [
                WordOption(word: "Advance", meaning: "前進する・進歩"),
                WordOption(word: "Advise", meaning: "助言する"),
                WordOption(word: "Adventure", meaning: "冒険"),
                WordOption(word: "Advocate", meaning: "支持する")
            ],
            hint: "前に進む「前進する」や技術の「進歩」を意味するよ。 'in advance' で「事前に」という超重要熟語になるんだ。君の英語力も、このアプリで確実に advance しているからね！",
            level: .advanced
        ),
        Question(
            text: "To publicly support a particular way of thinking or doing things.",
            answer: "Advocate",
            options: [
                WordOption(word: "Advocate", meaning: "（主義・主張を）支持する・提唱する"),
                WordOption(word: "Advise", meaning: "助言する"),
                WordOption(word: "Advance", meaning: "前進する"),
                WordOption(word: "Allocate", meaning: "割り当てる")
            ],
            hint: "ある考えを公に「支持する、提唱する」という、論文やニュースで大活躍する大人の単語。 ad（〜へ）+ vocate（声を出す = voice）という語源を知っていると、一発で記憶に定着するよ！",
            level: .advanced
        ),
        Question(
            text: "A holy table or raised place used in religious ceremonies.",
            answer: "Altar",
            options: [
                WordOption(word: "Altar", meaning: "祭壇"),
                WordOption(word: "Alter", meaning: "変える"),
                WordOption(word: "Alert", meaning: "警告する"),
                WordOption(word: "After", meaning: "〜の後に")
            ],
            hint: "教会などの「祭壇」を表すフォーマルな単語。最大にして最強の罠は alter（変える）とのつづりちがい！「a」ltar は「祭壇」、「a」lter は「チェンジ（変える）」。この区別ができたら、君はもう上級者の仲間入りだ！",
            level: .advanced
        ),
        Question(
            text: "To think that something is true, even when you have no proof.",
            answer: "Assume",
            options: [
                WordOption(word: "Assume", meaning: "（証拠なしに）想定する・思い込む"),
                WordOption(word: "Presume", meaning: "推定する"),
                WordOption(word: "Consume", meaning: "消費する"),
                WordOption(word: "Resume", meaning: "再開する")
            ],
            hint: "はっきりした証拠はないけれど「おそらくそうだろうと思い込む」という意味の重要単語。語尾の -sume は「取る」という意味。一歩ずつの学習で、大人の知的な会話に欠かせないこの感覚をしっかり assume していこう！",
            level: .advanced
        ),
        Question(
            text: "To succeed in getting something that you have prepared or worked for.",
            answer: "Attain",
            options: [
                WordOption(word: "Attain", meaning: "（努力の末に）達成する・手に入れる"),
                WordOption(word: "Obtain", meaning: "手に入れる"),
                WordOption(word: "Sustain", meaning: "維持する"),
                WordOption(word: "Abstain", meaning: "控える")
            ],
            hint: "長年の努力や準備の末に、目標や地位を「達成する、獲得する」という最高にポジティブな単語！ -tain（つかむ）シリーズだけど、今回の ad-（〜へ）+ attain は「目標に向かって手を伸ばしてつかみ取る」情景だよ。君の夢も必ず attain できるよ！",
            level: .advanced
        ),
        Question(
            text: "To carefully judge the quality, value, or size of something.",
            answer: "Assess",
            options: [
                WordOption(word: "Assess", meaning: "（価値や影響を）評価する・査定する"),
                WordOption(word: "Assert", meaning: "断言する"),
                WordOption(word: "Access", meaning: "接近・アクセス"),
                WordOption(word: "Assist", meaning: "手助けする")
            ],
            hint: "状況や価値をじっくり考えて「評価する、査定する」という意味。環境アセスメントの『アセスメント』だね！ sが4つもあるユニークな形を、愛着を持って覚えてね！",
            level: .advanced
        ),
        Question(
            text: "To feel sure that something is true, or that someone is telling the truth.",
            answer: "Believe",
            options: [
                WordOption(word: "Believe", meaning: "信じる・思う"),
                WordOption(word: "Relieve", meaning: "和らげる"),
                WordOption(word: "Receive", meaning: "受け取る"),
                WordOption(word: "Deceive", meaning: "だます")
            ],
            hint: "心から「信じる」という意味。 'I believe so.' で「私はそう思います」という知的な表現になるよ。君の可能性を、私もいつでも believe しているからね！",
            level: .advanced
        ),
        Question(
            text: "A band of leather or cloth that you wear around your waist.",
            answer: "Belt",
            options: [
                WordOption(word: "Belt", meaning: "ベルト・帯"),
                WordOption(word: "Bold", meaning: "大胆な"),
                WordOption(word: "Bolt", meaning: "ボルト"),
                WordOption(word: "Bait", meaning: "えさ・おとり")
            ],
            hint: "ズボンが落ちないように腰に巻く「ベルト」のこと。日常会話では、車の『シートベルト』や、工場などの『ベルトコンベアー』のようによく登場するよ。",
            level: .advanced
        ),
        Question(
            text: "To hit something or someone while moving, especially in a vehicle.",
            answer: "Collide",
            options: [
                WordOption(word: "Collide", meaning: "衝突する・ぶつかる"),
                WordOption(word: "Provide", meaning: "提供する"),
                WordOption(word: "Divide", meaning: "分ける"),
                WordOption(word: "Collapse", meaning: "崩壊する")
            ],
            hint: "動いているもの同士が激しく「衝突する」という意味。車だけでなく、意見やスケジュールが『真っ向からぶつかる』ときにも使うよ！",
            level: .advanced
        ),
        Question(
            text: "A tall, thick post that is used to support a roof or a building.",
            answer: "Column",
            options: [
                WordOption(word: "Column", meaning: "柱・（新聞などの）コラム・列"),
                WordOption(word: "Volume", meaning: "音量・ボリューム"),
                WordOption(word: "Autumn", meaning: "秋"),
                WordOption(word: "Solemn", meaning: "厳かな")
            ],
            hint: "建物を支える立派な「柱」のこと。そこから、新聞や雑誌の『縦の列（囲み記事）』、つまり日本語でもおなじみの『コラム』という意味になったんだよ。",
            level: .advanced
        ),
        Question(
            text: "To use fuel, energy, or time, or to eat and drink.",
            answer: "Consume",
            options: [
                WordOption(word: "Consume", meaning: "消費する"),
                WordOption(word: "Resume", meaning: "再開する"),
                WordOption(word: "Assume", meaning: "想定する"),
                WordOption(word: "Presume", meaning: "推定する")
            ],
            hint: "エネルギーや時間を「消費する」こと。中級に出た consumer（消費者）の動詞形だよ。使い切るイメージだね！",
            level: .advanced
        ),
        Question(
            text: "Permission for something to happen or agreement to do something.",
            answer: "Consent",
            options: [
                WordOption(word: "Consent", meaning: "同意・許可"),
                WordOption(word: "Content", meaning: "内容"),
                WordOption(word: "Context", meaning: "文脈"),
                WordOption(word: "Convert", meaning: "変換する")
            ],
            hint: "何かに「同意する、許可を与える」こと。ビジネスや医療の現場で、正式に『OK』を出す情景だよ。",
            level: .advanced
        ),
        Question(
            text: "One of the parts that a thing is made of.",
            answer: "Constituent",
            options: [
                WordOption(word: "Constituent", meaning: "構成要素・成分"),
                WordOption(word: "Consistent", meaning: "一貫した"),
                WordOption(word: "Constraint", meaning: "制約"),
                WordOption(word: "Constant", meaning: "一定の")
            ],
            hint: "全体を作り上げている「構成要素」のこと。少し難しいけれど、パズルのピースをイメージすると分かりやすいよ！",
            level: .advanced
        ),
        Question(
            text: "A small vehicle used for traveling on water.",
            answer: "Boat",
            options: [
                WordOption(word: "Boat", meaning: "ボート・小舟"),
                WordOption(word: "Boot", meaning: "ブーツ・長靴"),
                WordOption(word: "Coat", meaning: "コート"),
                WordOption(word: "Goat", meaning: "ヤギ")
            ],
            hint: "水の上を進む「ボート」のこと。大型の船（ship）よりも小さくて、川や湖で使う身近な乗り物をイメージしてね。さあ、英語の海へ漕ぎ出そう！",
            level: .advanced
        ),
        Question(
            text: "To say that something is caused by a specific person or thing.",
            answer: "Attribute",
            options: [
                WordOption(word: "Attribute", meaning: "〜のせいにする・〜の性質と考える"),
                WordOption(word: "Contribute", meaning: "貢献する"),
                WordOption(word: "Distribute", meaning: "分配する"),
                WordOption(word: "Attain", meaning: "達成する")
            ],
            hint: " 'attribute A to B' で「A（結果）はB（原因）のせいである（おかげである）」と結びつける超重要単語。  contribute（貢献する・差し出す）と同じ -tribute（与える）の仲間だよ。失敗を誰かの attribute（せい）にせず、自分の成長の糧にできる人はかっこいいよね！",
            level: .advanced
        ),
        Question(
            text: "To say that what someone said is wrong by saying the opposite.",
            answer: "Contradict",
            options: [
                WordOption(word: "Contradict", meaning: "矛盾する・反論する"),
                WordOption(word: "Contrast", meaning: "対比させる"),
                WordOption(word: "Predict", meaning: "予測する"),
                WordOption(word: "Conflict", meaning: "衝突する")
            ],
            hint: "相手の話に対して「それは違う」と「矛盾する、反論する」こと。contra（反対に）+ dict（言う）という語源で覚えよう！",
            level: .advanced
        ),
        Question(
            text: "Using power in a dishonest way to get money.",
            answer: "Corrupt",
            options: [
                WordOption(word: "Corrupt", meaning: "汚職した・堕落した"),
                WordOption(word: "Correct", meaning: "正しい"),
                WordOption(word: "Interrupt", meaning: "中断させる"),
                WordOption(word: "Abrupt", meaning: "突然の")
            ],
            hint: "お金のために正しくないことをする「汚職した、不誠実な」状態。以前出た interrupt（中断する）と同じ仲間の言葉だよ。",
            level: .advanced
        ),
        Question(
            text: "To make something shorter or less than it was before.",
            answer: "Curtail",
            options: [
                WordOption(word: "Curtail", meaning: "削減する・短縮する"),
                WordOption(word: "Detail", meaning: "詳細"),
                WordOption(word: "Entail", meaning: "伴う"),
                WordOption(word: "Retail", meaning: "小売")
            ],
            hint: "予算や時間を「削減する、切り詰める」という意味。語尾に tail（しっぽ）がある通り、しっぽを切って短くするイメージだよ！",
            level: .advanced
        ),
        Question(
            text: "To attract or interest someone very strongly.",
            answer: "Allure",
            options: [
                WordOption(word: "Allure", meaning: "魅了する・引きつける"),
                WordOption(word: "Allege", meaning: "証拠なしに主張する"),
                WordOption(word: "Allot", meaning: "割り当てる"),
                WordOption(word: "Alleviate", meaning: "軽減する")
            ],
            hint: "人をうっとり「魅了する」という意味。高級な香水や化粧品のブランド名にもよく使われているよ。つづりが似ている難単語 allege（主張する）に負けずに、この単語の魅力をつかみ取ってね！",
            level: .advanced
        ),
        Question(
            text: "To choose actors to play the parts in a film or a play.",
            answer: "Cast",
            options: [
                WordOption(word: "Cast", meaning: "役を割り当てる・（視線を）向ける・投げる"),
                WordOption(word: "Cost", meaning: "費用がかかる"),
                WordOption(word: "Case", meaning: "場合"),
                WordOption(word: "Cats", meaning: "猫たち")
            ],
            hint: "映画などの「配役（キャスト）を決める」という動詞の使い方。元のコアな意味は「投げる」で、網をパッと投げ広げる情景の言葉だよ。",
            level: .advanced
        ),
        Question(
            text: "To say that something is true, even if you cannot prove it yet.",
            answer: "Claim",
            options: [
                WordOption(word: "Claim", meaning: "（当然の権利として）主張する"),
                WordOption(word: "Climb", meaning: "登る"),
                WordOption(word: "Aim", meaning: "目指す・狙う"),
                WordOption(word: "Acclaim", meaning: "称賛する")
            ],
            hint: "証拠はまだないけれど「これが正しい！」と強く「主張する」こと。日本語の「苦情（クレーム）」とは意味が違うから要注意！",
            level: .advanced
        ),
        Question(
            text: "To press a button on a computer mouse to choose something.",
            answer: "Click",
            options: [
                WordOption(word: "Click", meaning: "クリックする・カチッと音がする"),
                WordOption(word: "Clerk", meaning: "店員"),
                WordOption(word: "Clock", meaning: "時計"),
                WordOption(word: "Trick", meaning: "いたずら・手品")
            ],
            hint: "マウスのボタンを「クリックする」動作のこと。カチッと電子音が鳴る情景から生まれた言葉だよ。今日もナイスクリック！",
            level: .advanced
        ),Question(
            text: "To hit something or someone while moving, especially in a vehicle.",
            answer: "Collide",
            options: [
                WordOption(word: "Collide", meaning: "衝突する・ぶつかる"),
                WordOption(word: "Provide", meaning: "提供する"),
                WordOption(word: "Divide", meaning: "分ける"),
                WordOption(word: "Collapse", meaning: "崩壊する")
            ],
            hint: "動いているもの同士が激しく「衝突する」という意味。車だけでなく、意見やスケジュールが『真っ向からぶつかる』ときにも使うよ！",
            level: .advanced
        ),
        Question(
            text: "To become bad or be destroyed by natural processes; to rot.",
            answer: "Decay",
            options: [
                WordOption(word: "Decay", meaning: "腐敗する・衰える"),
                WordOption(word: "Delay", meaning: "遅延"),
                WordOption(word: "Decade", meaning: "10年間"),
                WordOption(word: "Decide", meaning: "決定する")
            ],
            hint: "自然に「腐敗する」や「ボロボロになる」こと。虫歯（tooth decay）の表現でもよく使われるよ！",
            level: .advanced
        ),
        Question(
            text: "To make someone believe something that is not true; to trick.",
            answer: "Deceive",
            options: [
                WordOption(word: "Deceive", meaning: "だます・欺く"),
                WordOption(word: "Receive", meaning: "受け取る"),
                WordOption(word: "Believe", meaning: "信じる"),
                WordOption(word: "Conceive", meaning: "思いつく")
            ],
            hint: "相手を「だます」こと。以前出てきた believe（信じる）や receive（受け取る）と同じ仲間だけど、意味は全然違うね！",
            level: .advanced
        ),
        Question(
            text: "To give a lot of your time and effort to a particular activity or person.",
            answer: "Dedicate",
            options: [
                WordOption(word: "Dedicate", meaning: "捧げる・専念する"),
                WordOption(word: "Delicate", meaning: "繊細な"),
                WordOption(word: "Delegate", meaning: "委任する"),
                WordOption(word: "Indicate", meaning: "示す")
            ],
            hint: "時間や努力を何かに「捧げる」こと。君が英語に dedicate しているこの時間は、絶対に無駄にならないよ！",
            level: .advanced
        ),
        Question(
            text: "A tall, thick post that is used to support a roof or a building.",
            answer: "Column",
            options: [
                WordOption(word: "Column", meaning: "柱・（新聞などの）コラム・列"),
                WordOption(word: "Volume", meaning: "音量・ボリューム"),
                WordOption(word: "Autumn", meaning: "秋"),
                WordOption(word: "Solemn", meaning: "厳かな")
            ],
            hint: "建物を支える立派な「柱」のこと。そこから、新聞や雑誌の『縦の列（囲み記事）』、つまり日本語でもおなじみの『コラム』という意味になったんだよ。",
            level: .advanced
        ),
        Question(
            text: "Easy to break or damage; needing careful treatment.",
            answer: "Delicate",
            options: [
                WordOption(word: "Delicate", meaning: "繊細な・壊れやすい"),
                WordOption(word: "Dedicate", meaning: "捧げる"),
                WordOption(word: "Delegate", meaning: "委任する"),
                WordOption(word: "Definite", meaning: "明確な")
            ],
            hint: "「繊細な」や「壊れやすい」こと。扱いが難しいものや、デリケートな話題に使うよ。ガラス細工のように優しく扱ってね。",
            level: .advanced
        ),
        Question(
            text: "To make someone feel very sad and without hope.",
            answer: "Depress",
            options: [
                WordOption(word: "Depress", meaning: "落胆させる・景気を悪くする"),
                WordOption(word: "Express", meaning: "表現する"),
                WordOption(word: "Impress", meaning: "印象づける"),
                WordOption(word: "Suppress", meaning: "抑える")
            ],
            hint: "「落ち込ませる」こと。景気が悪い（デフレ）ときにも使うよ。落ち込んだ時は深呼吸。君の努力をこのアプリは応援しているよ！",
            level: .advanced
        ),
        Question(
            text: "To take something away from someone so they cannot have it.",
            answer: "Deprive",
            options: [
                WordOption(word: "Deprive", meaning: "奪う・免職する"),
                WordOption(word: "Derive", meaning: "引き出す"),
                WordOption(word: "Depress", meaning: "落胆させる"),
                WordOption(word: "Deserve", meaning: "〜に値する")
            ],
            hint: "「奪う」という意味。 'deprive A of B' （AからBを奪う）の形でよく出るよ。自由や権利の大切さを考えさせられる言葉だね。",
            level: .advanced
        ),
        Question(
            text: "To get something from a specific source.",
            answer: "Derive",
            options: [
                WordOption(word: "Derive", meaning: "由来する・引き出す"),
                WordOption(word: "Deprive", meaning: "奪う"),
                WordOption(word: "Deliver", meaning: "届ける"),
                WordOption(word: "Divide", meaning: "分ける")
            ],
            hint: "何かから「由来する」こと。言葉の語源（source）をたどるときによく使う、知的な響きの単語だよ。語彙力の源（derive）を増やそう！",
            level: .advanced
        ),
        Question(
            text: "To decide that something is true after considering all the information.",
            answer: "Conclude",
            options: [
                WordOption(word: "Conclude", meaning: "結論づける・締めくくる"),
                WordOption(word: "Include", meaning: "含む"),
                WordOption(word: "Exclude", meaning: "除外する"),
                WordOption(word: "Preclude", meaning: "排除する")
            ],
            hint: "データをしっかり見て「結論づける」こと。語尾の -clude は「閉じる」という意味。すべての議論を最後にパタンと『閉じる』情景の言葉だよ。",
            level: .advanced
        ),
        Question(
            text: "An official name, title, or description given to someone or something.",
            answer: "Designation",
            options: [
                WordOption(word: "Designation", meaning: "名称・指定・任命"),
                WordOption(word: "Destination", meaning: "目的地"),
                WordOption(word: "Description", meaning: "描写"),
                WordOption(word: "Decoration", meaning: "装飾")
            ],
            hint: "公式な「名称」や「指名」のこと。 design（形づくる）から来ているよ。 destination（目的地）と間違えやすいから慎重に！",
            level: .advanced
        ),
        Question(
            text: "To force someone to stay in a place and not let them leave.",
            answer: "Detain",
            options: [
                WordOption(word: "Detain", meaning: "引き止める・拘留する"),
                WordOption(word: "Retain", meaning: "保持する"),
                WordOption(word: "Attain", meaning: "達成する"),
                WordOption(word: "Obtain", meaning: "手に入れる")
            ],
            hint: "人を「引き止める」や「拘留する」こと。 -tain（つかむ）仲間の言葉だね。相手をその場に留めておくイメージだよ。",
            level: .advanced
        ),
        Question(
            text: "To do something that is different from what is usual or expected.",
            answer: "Deviate",
            options: [
                WordOption(word: "Deviate", meaning: "逸脱する・それる"),
                WordOption(word: "Dedicate", meaning: "捧げる"),
                WordOption(word: "Delegate", meaning: "委任する"),
                WordOption(word: "Elevate", meaning: "高める")
            ],
            hint: "いつもの道や計画から「それる」こと。 via（道）から外れるのが語源だよ。たまには道に迷うのも、新しい発見があっていいよね！",
            level: .advanced
        ),
        Question(
            text: "To tell a secret to someone because you trust them completely.",
            answer: "Confide",
            options: [
                WordOption(word: "Confide", meaning: "（秘密を）打ち明ける・信頼する"),
                WordOption(word: "Confirm", meaning: "確認する"),
                WordOption(word: "Confuse", meaning: "混乱させる"),
                WordOption(word: "Confine", meaning: "制限する・閉じ込める")
            ],
            hint: "信頼できる人にだけ内緒話を「打ち明ける」という意味。語源の fide は「信頼・信じる」。君がこのアプリを信じてくれるなら、私も全力で並走するよ！",
            level: .advanced
        ),
        Question(
            text: "To behave in the same way as most other people, or to follow a rule.",
            answer: "Conform",
            options: [
                WordOption(word: "Conform", meaning: "（規則や周囲に）従う・合わせる"),
                WordOption(word: "Confirm", meaning: "確認する"),
                WordOption(word: "Perform", meaning: "行う・演奏する"),
                WordOption(word: "Inform", meaning: "知らせる")
            ],
            hint: "社会のルールや周りの空気に自分の形（form）を「合わせる、従う」こと。ビジネス文書や規約チェックのシーンで非常によく見かける大人の言葉だよ。",
            level: .advanced
        ),
        Question(
            text: "Clearly separate and different from others.",
            answer: "Distinct",
            options: [
                WordOption(word: "Distinct", meaning: "はっきりと異なる・際立った"),
                WordOption(word: "Distance", meaning: "距離"),
                WordOption(word: "Destiny", meaning: "運命"),
                WordOption(word: "Instinct", meaning: "本能")
            ],
            hint: "他とは「はっきりと違う」ということ。形や音がクリアに見える・聞こえるときにも使うよ。君の才能はきっと distinct（際立って）いるはず！",
            level: .advanced
        ),
        Question(
            text: "To give something to a large number of people.",
            answer: "Distribute",
            options: [
                WordOption(word: "Distribute", meaning: "分配する・配布する"),
                WordOption(word: "Contribute", meaning: "貢献する"),
                WordOption(word: "Attribute", meaning: "〜のせいにする"),
                WordOption(word: "Disturb", meaning: "邪魔する")
            ],
            hint: "多くの人に物を「配る、分配する」こと。以前出た contribute（貢献する）と同じ -tribute（与える）仲間の言葉だよ！",
            level: .advanced
        ),
        Question(
            text: "The act of sharing things among a large group of people.",
            answer: "Distribution",
            options: [
                WordOption(word: "Distribution", meaning: "分配・流通・分布"),
                WordOption(word: "Description", meaning: "描写"),
                WordOption(word: "Destination", meaning: "目的地"),
                WordOption(word: "Contribution", meaning: "貢献")
            ],
            hint: "「分配」や「流通」のこと。ひとつ前の問題 distribute（分配する）の名詞形だよ。セットで覚えれば語彙ネットワークが広がるね！",
            level: .advanced
        ),
        Question(
            text: "To completely remove or get rid of something that is unnecessary.",
            answer: "Eliminate",
            options: [
                WordOption(word: "Eliminate", meaning: "取り除く・排除する"),
                WordOption(word: "Illuminate", meaning: "照らす"),
                WordOption(word: "Estimate", meaning: "見積もる"),
                WordOption(word: "Dominate", meaning: "支配する")
            ],
            hint: "不要なものを完全に「取り除く」こと。ミスやムダを eliminate して、目標への道をスッキリさせよう！",
            level: .advanced
        ),
        Question(
            text: "To set someone free from the control or power of another.",
            answer: "Emancipate",
            options: [
                WordOption(word: "Emancipate", meaning: "解放する・自由にする"),
                WordOption(word: "Participate", meaning: "参加する"),
                WordOption(word: "Anticipate", meaning: "予期する"),
                WordOption(word: "Embrace", meaning: "受け入れる")
            ],
            hint: "支配から「解放する」という少し難しい言葉。歴史の授業でも出てくるけれど、現代では心の自由を語る時にも使われるよ。",
            level: .advanced
        ),
        Question(
            text: "An imaginary line around the middle of the earth.",
            answer: "Equator",
            options: [
                WordOption(word: "Equator", meaning: "赤道"),
                WordOption(word: "Equation", meaning: "方程式"),
                WordOption(word: "Quarter", meaning: "4分の1"),
                WordOption(word: "Theater", meaning: "劇場")
            ],
            hint: "地球の真ん中をぐるっと回る「赤道」のこと。 equal（等しい）の仲間で、地球を北と南に等しく分ける線、と覚えよう！",
            level: .advanced
        ),
        Question(
            text: "To make something seem larger, better, or worse than it really is.",
            answer: "Exaggerate",
            options: [
                WordOption(word: "Exaggerate", meaning: "誇張する・大げさに言う"),
                WordOption(word: "Exasperate", meaning: "怒らせる"),
                WordOption(word: "Accelerate", meaning: "加速させる"),
                WordOption(word: "Aggravate", meaning: "悪化させる")
            ],
            hint: "話を盛って「大げさに言う」こと。gが2つある綴りに注意。日常会話でも『それは言い過ぎだよ！』と突っ込む時に使われるよ。",
            level: .advanced
        ),
        Question(
            text: "To make someone feel extremely annoyed or angry.",
            answer: "Exasperate",
            options: [
                WordOption(word: "Exasperate", meaning: "激怒させる・いらだたせる"),
                WordOption(word: "Exaggerate", meaning: "誇張する"),
                WordOption(word: "Expirate", meaning: "ダミー"),
                WordOption(word: "Exasperation", meaning: "憤り")
            ],
            hint: "人を「ひどく怒らせる、いらだたせる」こと。さっきの exaggerate と綴りが激似だから、今ここでしっかり見分けてドヤ顔しちゃおう！",
            level: .advanced
        ),
        Question(
            text: "To remove earth from a place to find old objects or to build something.",
            answer: "Excavate",
            options: [
                WordOption(word: "Excavate", meaning: "発掘する・穴を掘る"),
                WordOption(word: "Evaluate", meaning: "評価する"),
                WordOption(word: "Evacuate", meaning: "避難する"),
                WordOption(word: "Exclaim", meaning: "叫ぶ")
            ],
            hint: "地面を掘って「発掘する」こと。 ex（外へ）+ cave（洞窟・穴）という語源を知っていると、暗記がぐっと楽になるよ！",
            level: .advanced
        ),
        Question(
            text: "To use power, influence, or physical strength to make something happen.",
            answer: "Exert",
            options: [
                WordOption(word: "Exert", meaning: "（力などを）使う・行使する"),
                WordOption(word: "Expert", meaning: "専門家"),
                WordOption(word: "Exertion", meaning: "努力"),
                WordOption(word: "Insert", meaning: "挿入する")
            ],
            hint: "力や影響力を「働かせる、使う」こと。自分にプレッシャーをかける（exert pressure）時などにも使う、知的で力強い言葉だよ。",
            level: .advanced
        ),
        Question(
            text: "The quality of being fair and treat people in the same way.",
            answer: "Equity",
            options: [
                WordOption(word: "Equity", meaning: "公平・正義・純資産"),
                WordOption(word: "Quality", meaning: "質"),
                WordOption(word: "Equality", meaning: "平等"),
                WordOption(word: "Entity", meaning: "実体")
            ],
            hint: "単なる平等（equality）より、一人一人の状況に合わせた「公平」という意味でよく使われるよ。ビジネスでは資産のことも指すんだ。",
            level: .advanced
        ),
        Question(
            text: "Having the same amount, value, or purpose as something else.",
            answer: "Equivalent",
            options: [
                WordOption(word: "Equivalent", meaning: "同等の・相当する物"),
                WordOption(word: "Excellent", meaning: "優れた"),
                WordOption(word: "Eloquent", meaning: "雄弁な"),
                WordOption(word: "Efficient", meaning: "効率的な")
            ],
            hint: "価値や意味が「同等である」こと。少し難しいけれど、 equi-（同じ）+ valent（価値）という語源が隠れているよ！",
            level: .advanced
        ),
        Question(
            text: "To develop and change gradually over a long period of time.",
            answer: "Evolve",
            options: [
                WordOption(word: "Evolve", meaning: "進化する・発展する"),
                WordOption(word: "Involve", meaning: "巻き込む"),
                WordOption(word: "Solve", meaning: "解決する"),
                WordOption(word: "Revolve", meaning: "回転する")
            ],
            hint: "長い時間をかけて「進化する」こと。ポケモンの進化（evolution）はこの言葉の名詞形だよ。君の英語力も日々 evolve しているよ！",
            level: .advanced
        ),
        Question(
            text: "To start a new project or a long journey.",
            answer: "Embark",
            options: [
                WordOption(word: "Embark", meaning: "乗り出す・着手する"),
                WordOption(word: "Remark", meaning: "述べる"),
                WordOption(word: "Embargo", meaning: "通商禁止"),
                WordOption(word: "Embrace", meaning: "抱きしめる")
            ],
            hint: "船に乗って旅に出る、転じて新しい計画に「乗り出す」こと。さあ、英語の新しいステージへ embark しよう！",
            level: .advanced
        ),
        Question(
            text: "To accept something with great interest or enthusiasm.",
            answer: "Embrace",
            options: [
                WordOption(word: "Embrace", meaning: "受け入れる・抱きしめる"),
                WordOption(word: "Embarrass", meaning: "恥ずかしがらせる"),
                WordOption(word: "Replace", meaning: "取って代わる"),
                WordOption(word: "Encourage", meaning: "励ます")
            ],
            hint: "「抱きしめる」や、変化を喜んで「受け入れる」こと。新しい自分を embrace する勇気を持って進もう！",
            level: .advanced
        ),
        Question(
            text: "To make someone feel very happy, excited, and full of energy.",
            answer: "Exhilarate",
            options: [
                WordOption(word: "Exhilarate", meaning: "気分を浮き立たせる・元気づける"),
                WordOption(word: "Exaggerate", meaning: "誇張する"),
                WordOption(word: "Accelerate", meaning: "加速させる"),
                WordOption(word: "Exhaust", meaning: "疲れ果てさせる")
            ],
            hint: "人を「元気づける、わくわくさせる」という素敵な意味。ジェットコースターに乗った時のような、最高に爽快な気分を表すよ！",
            level: .advanced
        ),
        Question(
            text: "To use or spend time, money, or energy on something.",
            answer: "Expend",
            options: [
                WordOption(word: "Expend", meaning: "費やす・消費する"),
                WordOption(word: "Expand", meaning: "拡大する"),
                WordOption(word: "Extend", meaning: "伸ばす"),
                WordOption(word: "Expensive", meaning: "高価な")
            ],
            hint: "お金やエネルギーを「費やす」こと。おなじみの spend よりも少しフォーマルな響きがあるよ。 expand（拡大する）と間違えないように注意！",
            level: .advanced
        ),
        Question(
            text: "To give someone more control over their own life or situation.",
            answer: "Empower",
            options: [
                WordOption(word: "Empower", meaning: "権限を与える・力を与える"),
                WordOption(word: "Emphasize", meaning: "強調する"),
                WordOption(word: "Employs", meaning: "雇う"),
                WordOption(word: "Employ", meaning: "雇う")
            ],
            hint: "誰かに「力を与える」こと。 em（〜にする）+ power（力）という語源そのままだね。このアプリが君を empower できますように！",
            level: .advanced
        ),
        Question(
            text: "To kill or destroy a group of people or animals completely.",
            answer: "Exterminate",
            options: [
                WordOption(word: "Exterminate", meaning: "根絶させる・駆除する"),
                WordOption(word: "Exterminate", meaning: "駆除する"), // ※実装時は異なるダミーを配置
                WordOption(word: "Determine", meaning: "決定する"),
                WordOption(word: "Terminate", meaning: "終わらせる"),
                WordOption(word: "Eliminate", meaning: "排除する")
            ],
            hint: "害虫などを「一掃する、駆除する」という意味。以前出た terminate（終わらせる）の超強力バージョンだと考えれば覚えやすいよ！",
            level: .advanced
        ),
        Question(
            text: "Knowing a lot about many different things or a particular subject.",
            answer: "Knowledgeable",
            options: [
                WordOption(word: "Knowledgeable", meaning: "博学な・熟知している"),
                WordOption(word: "Knowledge", meaning: "知識"),
                WordOption(word: "Acknowledge", meaning: "認める"),
                WordOption(word: "Noticeable", meaning: "目立つ")
            ],
            hint: "物知りで「博学な」様子。おなじみの knowledge（知識）に able（〜できる）がついた形だよ。君もこのアプリでどんどん knowledgeable になっていこう！",
            level: .advanced
        ),
        Question(
            text: "An official decision made by a jury in a court.",
            answer: "Verdict",
            options: [
                WordOption(word: "Verdict", meaning: "（陪審員の）評決・判断"),
                WordOption(word: "Vertical", meaning: "垂直の"),
                WordOption(word: "Version", meaning: "版・バージョン"),
                WordOption(word: "Verify", meaning: "確かめる")
            ],
            hint: "裁判で出される「評決」のこと。 dict（言う）+ ver（真実）で『真実を言う』のが語源なんだ。重みのある言葉だね。",
            level: .advanced
        ),
        Question(
            text: "To prove that something is true or correct.",
            answer: "Verify",
            options: [
                WordOption(word: "Verify", meaning: "確かめる・証明する"),
                WordOption(word: "Clarify", meaning: "明らかにする"),
                WordOption(word: "Identify", meaning: "特定する"),
                WordOption(word: "Modify", meaning: "修正する")
            ],
            hint: "それが正しいか「確かめる」こと。ネットの『本人確認』などでよく使われる、信頼に関わる大切なステップだね！",
            level: .advanced
        ),
        Question(
            text: "To show or provide a good reason for something.",
            answer: "Justify",
            options: [
                WordOption(word: "Justify", meaning: "正当化する・正しいと証明する"),
                WordOption(word: "Identify", meaning: "特定する"),
                WordOption(word: "Justice", meaning: "正義"),
                WordOption(word: "Verify", meaning: "検証する")
            ],
            hint: "自分の行動などが正しいと「正当化する、説明する」こと。 justice（正義）に関連した動詞だよ。難しいけれど、論理的に話すときに大活躍する言葉だね。",
            level: .advanced
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
