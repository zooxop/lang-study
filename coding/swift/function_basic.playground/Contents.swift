/* 함수 */

import Swift

// MARK: - 함수의 선언

// MARK: 함수선언의 기본형태
//func 함수이름(매개변수1 이름: 매개변수1 타입, 매개변수1 이름: 매개변수2타입 ...) -> 반환타입 {  // 반환값이 없을땐 "Void"를 쓰거나, 생략하면 된다.
//  함수 구현부
//  return 반환값
//}

func sum(a: Int, b: Int) -> Int {
    return a + b
}

func printMyName(name: String) -> Void {
    print(name)
}

func printYourName(name: String) {
    print(name)
}

func maximumIntegerValue() -> Int {
    return Int.max
}

func hello() -> Void { print("hello") }

func bye() { print("bye") }


// MARK: - 함수의 호출

sum(a:3, b:5)

printMyName(name: "clover")

printYourName(name: "yagom")

maximumIntegerValue()

hello()

bye()
