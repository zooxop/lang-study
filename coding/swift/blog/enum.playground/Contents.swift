import UIKit

enum Media {
  case book(title: String, author: String, year: Int)
  case movie(title: String, director: String, year: Int)
  case website(urlString: String)
}

let media = Media.movie(title: "Captain America: Civil War", director: "Russo Brothers", year: 2016)

switch media {
case let Media.movie(title, _, _):
    print(title)
default:
    break
}

if case let Media.book(title, author, year) = media {
    print(title, author, year)
}


enum Media1 {
  case test1
}

var tt: Media1 = Media1.test1
if tt == Media1.test1 {
    print("11")
}


enum Weekday {
    case mon
    case tue
    case wed, thu, fri, sat, sun
}

// 할당
let day: Weekday = Weekday.mon

switch day {
case .mon, .tue, .wed, .thu, .fri:  // 타입 생략 가능
    print("평일")
case Weekday.sat:
    print("토요일")
case .sun:
    print("일요일")
}

if day == Weekday.fri {
    print("불금!")
} else {
    print("불금이 아님 ㅜ")
}



enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach = 2
}

print(Fruit.apple)
// 출력: apple
print(Fruit.apple.rawValue)
// 출력: 0

var gra: Fruit = Fruit.grape

if gra == Fruit.grape {
    print(true)
}

enum School: String {
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university  // 초기화를 안해준다면, case의 이름을 그대로 rawValue로 갖는다.
}


print(School.middle.rawValue)
// 출력: 중등

print(School.university.rawValue)
// 출력: university


let apple: Fruit? = Fruit(rawValue: 0)

if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다.")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다.")
}  //
