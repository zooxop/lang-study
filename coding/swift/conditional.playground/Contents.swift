/* 조건문 */
import Swift

let someInteger = 100

// MARK: - if-else
// 조건식에 소괄호() 는 생략이 가능.
// 중괄호는 생략 불가능.
// if someInteger = 100 print("100") => Error

if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 이상")
} else {
    print("100")
}

// 스위프트에 조건식에는 "반드시" Bool 타입이 들어와야 함.
//  - Int 타입의 0 값 등으로 대체가 불가능하다.
// if someInteger { }  // Error


// MARK: switch
// - case 작성시, 명확히 경우의수마다 case를 작성해주지 않는다면 반드시 default 구문을 작성해주어야 한다.
// - break 는 적을 필요가 없다.

// 범위 연산자를 활용하면 더욱 쉽고 유용하다.
// ".."은 미만, "..."은 이하 이다.

switch someInteger {
case 0:
    print("zero")
case 1..<100:    // 1 이상, 100 "미만"
    print("1~99")
case 100:
    print("100")
case 101...Int.max:  //101 이상, Int.max "이하"
    print("over 100")
default:
    print("unknown")
}

// 정수 외의 대부분의 기본 타입을 사용할 수 있다.
switch "yagom"{
case "jake":
    print("jake")
    // fallthrough  // fallthrough : break를 쓰지 않은 것처럼 작동하게 해준다.
case "mina":
    print("mina")
case "yagom":
    print("yagom!!")
default:
    print("unknown")
}
