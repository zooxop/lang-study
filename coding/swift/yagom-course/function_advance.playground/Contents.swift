/* 함수 고급 */

import Swift

// MARK: - 매개변수 기본값

// 기본값을 갖는 매개변수는, 매개변수 목록 중 뒤쪽에 위치하는 것이 좋습니다.
//func 함수이름(매개변수1 이름: 매개변수1 타입, 매개변수2 이름: 매개변수2 타입 = 매개변수 기본값 ...) -> 반환타입 {
//  함수 구현부
//  return 반환값
//}

func greeting(friend: String, me: String = "Clover"){
    print("Hello \(friend)! I'm \(me)")
}

// 매개변수 기본값을 가지는 매개변수는 생략할 수 있습니다.
greeting(friend: "hana")
greeting(friend: "john", me: "eric")

// MARK: - 전달인자 레이블 (일종의 별칭, Alias)

// 전달인자 레이블은 함수를 호출할 때
// 매개변수의 역할을 좀 더 명확하게 하거나
// 함수 사용자의 입장에서 표현하고자 할 때 사용한다.

func greeting(to friend: String, from me: String){
    print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출할 때에는, "전달인자 레이블"을 사용해야 한다.
greeting(to: "hana", from: "Clover")


// MARK: - 가변 매개변수

// 전달 받을 값의 개수를 알기 어려울 때 사용할 수 있다.
// 가변 매개변수는 함수당 하나만 가질 수 있다.

func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)!"
}

print(sayHelloToFriends(me: "Clover", friends:"hana", "eric", "wing"))

print(sayHelloToFriends(me: "yagom"))

/*
 위에서 설명한 함수의 다양한 모양은 모두 섞어서 사용 가능하다.
 */

// MARK: - 데이터 타입으로서의 함수

// 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이다.
// 스위프트의 함수는 일급 객체이므로 변수, 상수등에 저장이 가능하고
// 매개변수를 통해 전달할 수도 있다.

// MARK: - 함수의 타입 표현
// (매개변수1 타입, 매개변수2 타입 ...) -> 반환타입  // 반환타입을 생략할 수 없다.
var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "Clover")


someFunction = greeting(friend:me:)
someFunction("eric", "Clover")

// 타입이 다른 함수는 할당할 수 없다.
// someFunction = sayHelloToFriends(me: friends:)  //Error.


// 함수의 매개변수 타입을 function으로 지정할 수도 있다.
func runAnother(function: (String, String) -> Void) {
    function("jenny", "mike")
}

runAnother(function: greeting(friend:me:))

runAnother(function: someFunction)
