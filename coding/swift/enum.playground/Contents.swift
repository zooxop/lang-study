/* 열거형 */

import UIKit

// MARK: - 정의

// enum은 타입이므로 대문자 카멜케이스를 사용하여 이름을 정의합니다.
// 각 case는 소문자 카멜케이스로 정의합니다.
// 각 case는 그 자체가 고유의 값입니다.

//enum 이름 {
//  case 이름1
//  case 이름2
//  case 이름3 이름4 이름5
//  ...
//}

// MARK: 열거형 사용

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

var day: Weekday = Weekday.mon
day = .tue  //축약형

print(day)

// switch문 내에서 enum의 모든 케이스를 다룬다면 default를 작성할 필요가 없음.
switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다.")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}

// MARK: - 원시값

// C언어의 enum처럼 정수값을 가질 수도 있습니다.
// rawValue를 사용하면 됩니다.
// case별로 각각 다른 값을 가져야 합니다.

enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
    // C언어처럼 자동으로 1씩 증가하기 때문에, [case peach] 까지만 작성해도 2 값이 할당됨.
    // case mango = 0
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// 출력 : Fruit.peach.rawValue == 2

// 정수 타입 뿐만 아니라
// Hashable 프로토콜을 따르는 모든 타입이 원시값의 타입으로 지정될 수 있습니다.

enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university  // 초기화를 안해준다면, case의 이름을 그대로 rawValue로 갖는다.
}

print("School.middle.rawValue == \(School.middle.rawValue)")
// 출력 : School.middle.rawValue == 중등

print("School.university.rawValue == \(School.university.rawValue)")
// 출력 : School.university.rawValue == university


// MARK: 원시값을 통한 초기화

// rawValue를 통해 초기화 할 수 있습니다.
// rawValue가 case에 해당하지 않을 수 있으므로
// rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입입니다.

//let apple: Fruit = Fruit(rawValue: 0)  //Error. Optional로 선언해야 한다.
let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다.")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다.")
}  //출력 : rawValue 5에 해당하는 케이스가 없습니다.


// MARK: 메서드

enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage(){
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}

print(Month.mar.printMessage())  // 출력 : 따스한 봄~

var jul: Month = Month.jul
print(jul.printMessage())
