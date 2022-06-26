/* assert와 guard */

// 애플리케이션이 동작 도중에 생성하는 다양한 결과값을
// 동적으로 확인하고 안전하게 처리할 수 있도록
// 확인하고 빠르게 처리할 수 있다.

import Swift

// MARK: - Assertion
// assert(_:_:file:line:) 함수를 사용.
// assert 함수는 디버깅 모드에서만 동작한다.
// 배포하는 애플리케이션에서는 제외된다.
// 주로 디버깅 중 조건의 검증을 위하여 사용한다.

var someInt: Int = 0

assert(someInt == 0, "someInt != 0")

someInt = 1
// assert(someInt == 0) // 동작 중지, 검증 실패
// assert(someInt == 0, "someInt != 0") // 동작 중지, 검증 실패
// assertion failed: someInt != 0: file guard_assert.swift, line 26


func functionWithAssert(age: Int?) {
    assert(age != nil, "age == nil")
    
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다.")
    print("당신의 나이는 \(age!)세 입니다.")
}

functionWithAssert(age: 50)
// functionWithAssert(age: -1)  // 동작 중지, 검증 실패
// functionWithAssert(age: nil)  // 동작 중지, 검증 실패


// MARK: - Early Exit
// guard를 사용하여 잘못된 값의 전달 시, 특정 실행구문을 빠르게 종료한다.
// 디버깅 모드 뿐만 아니라, 어떤 조건에서든 동작한다.
// guard의 else 블럭 내부에는 특정 코드블럭을 종료하는 지시어(return, break 등)가 꼭 있어야 한다.
// 타입 캐스팅, 옵셔널과 자주 사용된다.
// 그 외 단순 조건 판단 후, 빠르게 종료할때도 용이하다.

func functionWithGuard(age: Int?){
    guard let unwrappedAge = age,
          unwrappedAge < 130,
          unwrappedAge >= 0 else {
        print("나이값 입력이 잘못되었습니다.")
        return
    }
    
//    if unwrappedAge < 100 else {
//        // do something
//        // ...
//        // ...
//    } else {
//        return
//    }
    
    //guard는, 위 구문을 아래처럼 축약해서 사용할 수 있다는 개념이다.
    
//    guard unwrappedAge < 100 else {
//        return
//    }
    
    print("당신의 나이는 \(unwrappedAge)세 입니다.")
}

var count = 1

while true {
    guard count < 3 else {
        break
    }
    print(count)
    count += 1
}
// 1
// 2


func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else {
        return
    }
    
    guard let age = info["age"] as? Int, age >= 0 else {
        return
    }
    
    print("\(name): \(age)")
}

someFunction(info: ["name": "jenny", "age": "10"])  // age가 String이므로, guard 구문에 걸려서 탈출함.
someFunction(info: ["name": "mike"])  // age가 nil이므로, guard 구문에 걸려서 탈출함.
someFunction(info: ["name": "yagom", "age": 10])  // yagom: 10
