/* 옵셔널 값 추출 */

import Swift

// 옵셔널 값을 추출하는 방법은 아래 두가지가 있다.
// - Optional Binding (옵셔널 바인딩)
// - Force Unwrapping (강제 추출)


// 옵셔널 바인딩
// nil 체크 + 안전한 값 추출 보장

func printName(_ name: String) {
    print(name)
}

var myName: String? = nil

// 전달되는 값의 타입이 다르기 때문에(String과 Optional) 컴파일 오류가 발생한다.
//printName(myName)


// 그래서, "if-let" 구문을 사용한다.
var myName2: String! = nil  //암시적 추출 옵셔널

if let name: String = myName2 {  // 상수 "name"에 "myName2"를 [바인딩] 하여서 "nil 체크"를 하고, nil이 아니라면 true로 작동한다.
    printName(name)
} else {
    print("myName2 == nil")
}
// name 상수는 if-let 구문 내에서만 사용 가능하다.

//printName(name) // 상수 사용범위를 벗어났기 때문에, 컴파일 오류가 발생.


// "if-let" 구문을 통한 바인딩은 동시에 여러개를 할 수도 있다.
myName = "Clover"
var yourName: String? = nil

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// yourName이 nil이기 때문에, 실행이 되지 않는다.

yourName = "hana"
if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// yourName에 "hana"를 할당해주었기 때문에, print()가 실행된다.



// 강제 추출 (Force Unwrapping)
// 옵셔널의 값을 강제로 추출한다.
// 런타임 에러를 야기할 가능성이 크다.(비추천)

func printNameForce(_ name: String) {
    print(name)
}

var myNameForce: String? = "Clover"

printNameForce(myNameForce!)  //강제 추출: "!"

myNameForce = nil

print(myNameForce!)
// 강제 추출시, 값이 없으므로 런타임 오류 발생.

var yourNameForce: String! = nil

printNameForce(yourNameForce)  //yourNameForce가 "암시적 추출 옵셔널"로 선언되어 있기 때문에, "!"를 붙이지 않고도 사용할 수 있음.
// nil 값이 전달되기 때문에, 런타임 오류 발생.
