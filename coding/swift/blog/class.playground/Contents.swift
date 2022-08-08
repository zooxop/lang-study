import UIKit

class MyInfo {
    
    init(gender: GenderType){
        self.genderType = gender
    }
    
    enum GenderType {
        case male
        case female
    }
    
    var name = ""
    var age = 0
    
    private var genderType: GenderType
    
    final func isAdult() -> Bool {
        if age > 19 {
            return true
        } else {
            return false
        }
    }
}

var myInfo = MyInfo(gender: .female)

// ----------------------

class GameInfo {
    var homeScore = 0
    var awayScore = 0
    
    func presentScore() -> String {
        return homeScore.description + " : " + awayScore.description
    }
    
    final func isHomeWinner() -> Bool {
        if homeScore > awayScore {
            return true
        } else {
            return false
        }
    }
}

class Soccer: GameInfo {
    var time = 0
}

class Baseball: GameInfo {
    var round = 0
    
    // final로 선언되어 있는 메서드는 override 할 수 없음.
    override func presentScore() -> String {
        return homeScore.description + " 대 " + awayScore.description
    }
}

let soccor = Soccer()
soccor.homeScore = 1
soccor.awayScore = 2
soccor.presentScore()

print(soccor.isHomeWinner())

let baseball = Baseball()
baseball.homeScore = 10
baseball.presentScore()


// ----------------------

class MyInfo2 {
    
    // stored property
    var name = ""
    var age = 0
    
    // lazy stored property
    lazy var images = [UIImage(named: "img1"), UIImage(named: "img2"),
                       UIImage(named: "img3"), UIImage(named: "img4"),
                       UIImage(named: "img5"), UIImage(named: "img6")]
    
    // computed property
    var isAdult: Bool {
        if age > 19 {
            return true
        }
        return false
    }
    
    var _email = ""
    var email: String {
        get {
            return _email.hash.description
        }
        set {
            _email = newValue
        }
    }
}

let myInfo2 = MyInfo2()
myInfo2.email = "abc@email.com"

myInfo2.email


// ----------------------


//class UserInfo {
//    var name: String
//    var id: String
//
//    init(name: String, id:String) {
//        self.name = name
//        self.id = id
//    }
//
//    init(name: String) {
//        self.name = name
//        self.id = ""
//    }
//
//    init() {
//        self.name = ""
//        self.id = ""
//    }
//}
//
//var user = UserInfo(name: "Moon", id: "clover")
//var user2 = UserInfo(name: "Kim")
//var user3 = UserInfo()
//
//print(user.name, user.id)
//// 출력: Moon clover
//
//print(user2.name, user2.id)
//// 출력: Kim
//
//print(user3.name, user3.id)
//// 출력:


class UserInfo {
    var name: String
    var id: String
    
    init(name: String, id: String) {
        self.name = name
        self.id = id
    }
    
    convenience init(name: String) {
        self.init(name: name, id: "")
    }

    convenience init() {
        self.init(name: "", id: "")
    }
}

var user = UserInfo(name: "Moon", id: "clover")
var user2 = UserInfo(name: "Kim")
var user3 = UserInfo()

print(user.name, user.id)
// 출력: Moon clover

print(user2.name, user2.id)
// 출력: Kim

print(user3.name, user3.id)
// 출력:



// ----------------------

class Game {
    var life: Int = 0
    
    init(life: Int) {
        self.life = life
        print("Game Start!")
    }
    
    func playerDead() {
        self.life -= 1
        print("남은 목숨: \(self.life)")
    }
    
}

var game: Game? = Game(life: 5)  // 인스턴스 생성
// 출력: Game Start!


class Player {
    var name: String
    var game: Game?
    
    init(name: String, game: Game?) {
        self.name = name
        self.game = game
    }
    
    deinit {  // 플레이어가 사라질 때 game 클래스의 playerDead() 메서드를 실행.
        game?.playerDead()
    }
}


var player: Player? = Player(name: "Mike", game: game)

player = nil  // player를 메모리 해제, deinit 실행.

// 출력: 남은 목숨: 4
