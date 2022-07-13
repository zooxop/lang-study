/* 옵셔널 */
import Swift
import Security


// Optional : 값이 "있을수도, 없을수도 있음."

let optionalConstant: Int? = nil  //가능
//let someConstant: Int = nil  //불가능


// 옵셔널이 왜 필요한가?
//  - nil의 가능성을 명시적으로 표현할 수 있다.
//   * 따라서, 문서화/주석 작성 시간을 절약 할 수 있다.
//  - 전달받는 값이 옵셔널이 아니라면, nil 체크를 하지 않고도 안심할 수 있다.
//   * 효율적으로 코딩할 수 있음.
//   * 예외 상황을 최소화 할 수 있음.

// "someOptionalParam" can be nil
func someFunction(someOptionalParam: Int?) {
    // ...
}

// "someParam" must not be nil
func someFunction(someParam: Int) {
    // ...
}

someFunction(someOptionalParam: nil)  //가능
//someFunction(someParam: nil)  //불가능


// 옵셔널은 enum + general 의 합작품이다.
// 옵셔널 설계 코드 (아럐)
/*
enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
}

let optionalValue: Optional<Int> = nil
let optionalValue: Int? = nil
 */


// 암시적 추출 옵셔널 (Implicitly Unwrapped Optional)
// 기존 변수처럼 사용 가능하다는 특징을 갖고 있다.

var optionalValue: Int! = 100

switch optionalValue {  //옵셔널은 열거형(enum)이기 때문에 switch-case로 사용 가능하다.
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// 암시적 추출 옵셔널이기 때문에, 기존 변수처럼 사용 가능하다.
optionalValue = optionalValue + 1

// nil을 할당 가능하다.
optionalValue = nil

// 잘못된 접근으로 인한 런타임 오류 발생 가능성이 존재한다.
// ex) nil을 할당 후, 아래처럼 "+1" 연산을 하면 런타임 에러가 발생한다.
//optionalValue = optionalValue + 1


// 일반적인 옵셔널 (Optional)

var optionalValue2: Int? = 100

switch optionalValue2 {  //옵셔널은 열거형(enum)이기 때문에 switch-case로 사용 가능하다.
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// 마찬가지로 nil 할당 가능하다.
optionalValue2 = nil

// 기존 변수처럼 사용 불가능하다. => 옵셔널과 일반 값은 "다른 타입"이므로, "연산이 불가능하다."
//optionalValue2 = optionalValue2 + 1
