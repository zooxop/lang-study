import UIKit

enum Media {
  case book(title: String, author: String, year: Int)
  case movie(title: String, director: String, year: Int)
  case website(urlString: String)
  case test1
}

let media = Media.movie(title: "Captain America: Civil War", director: "Russo Brothers", year: 2016)

switch media {
case let Media.movie(title, _, _):
    print(title)
default:
    break
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
