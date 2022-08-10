import UIKit

protocol UserInfo {
    var name: String { get set }
    var age: Int { get set }
    func isAdult() -> Bool
}


class Guest: UserInfo {
    var name: String = ""
    var age: Int = 0
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

class Member {
    
}

class VIPMember {
    
}

protocol Talkable {
    
    // 프로퍼티 요구
    // 프로퍼티 요구는 항상 var 키워드를 사용한다.
    // get은 읽기만 가능해도 상관 없다는 뜻이며,
    // get과 set을 모두 명시하면 읽기/쓰기 모두 가능한 프로퍼티여야 한다.
    var topic: String { get set }
    var language: String { get }
    // let test: String { get set } 불가능
    
    // 메서드 요구
    func talk()
    
    // 이니셜라이저 요구
    init(topic: String, language: String)
}

struct Person: Talkable {
    var topic: String
    
    let language: String
    
    func talk() {
        print("\(topic)에 대해 \(language)로 말합니다.")
    }
    
    init(topic: String, language: String) {
        self.topic = topic
        self.language = language
    }
}

var person: Person = Person(topic: "Swift", language: "한국어")
person.talk()
