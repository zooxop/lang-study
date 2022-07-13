/* 클래스, 구조체/열거형 비교 */

import Swift

// MARK: - Class vs Struct/Enum

struct ValueType {
    var property = 1
}

class ReferenceType {
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("first struct instance property : \(firstStructInstance.property)")  // 출력 : 1
print("second struct instance property : \(secondStructInstance.property)")  // 출력 : 2

// struct는 값 타입이기 때문에 "복사" 가 이루어지므로
// first~~ 와 second~~는 서로 다른 인스턴스이다.


let firstClassReference = ReferenceType()
var secondClassReference = firstClassReference
secondClassReference.property = 2

print("first class reference property : \(firstClassReference.property)")  // 출력 : 2
print("second class reference property: \(secondClassReference.property)") // 출력 : 2

// class는 참조 타입이기 때문에, 27번 라인에서 클래스의 주소(reference)를 할당해주었다.
// 따라서 28번 라인에서 변경된 값은 first~~의 값이다.

firstClassReference.property = 3
print("first class reference property : \(firstClassReference.property)")  // 출력 : 3
print("second class reference property: \(secondClassReference.property)") // 출력 : 3

