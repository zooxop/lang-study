/* 구조체 */

import Swift

// MARK: - 정의

//struct 이름 {
//  /* 구현부 */
//}

// MARK: 프로퍼티 및 메서드

struct Sample {
    var mutableProperty: Int = 100  // 가변 프로퍼티
    let immutableProperty: Int = 100 // 불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    static func typeMethod() {
        print("type method")
    }
}

// MARK: 구조체 사용

// 가변 인스턴스
var mutable: Sample = Sample()

mutable.mutableProperty = 200
// mutable.immutableProperty = 200  // Error. 구조체 자체에서 let(불변)으로 선언한 상수는 변경이 불가능함.

// 불변 인스턴스
let immutable: Sample = Sample()

// immutable.mutableProperty = 200 // Error. 인스턴스 선언 자체를 불변(let)으로 했기 때문에, 프로퍼티 값들을 변경할 수 없음.

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300  //static으로 선언했기 때문에 사용 가능.
Sample.typeMethod()  //type method

//mutable.typeProperty = 400  //Error. typeProperty는 인스턴스에서 접근이 불가능하다.
//mutable.typeMethod()  //Error. 마찬가지로, typeMethod는 인스턴스에서 접근이 불가능하다.


// MARK: - 학생 구조체
struct Student {
    var name: String = "unknown"
    var `class`: String = "Swift"  //예약어를 변수 명으로 사용할 때, 백틱으로 묶어주면 된다.
    
    static func selfIntroduce() {
        print("학생 타입입니다.")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce()  // 출력 : 학생 타입입니다.

var yagom: Student = Student()
yagom.name = "yagom"
yagom.class = "스위프트"
yagom.selfIntroduce()  // 출력 : 저는 스위프트반 yagom입니다.

let jina: Student = Student()
//jina.name = "jina"  //Error.  불변 인스턴스로 선언했으므로, 프로퍼티 값을 변경할 수 없다.
jina.selfIntroduce()  // 출력 : 저는 Swift반 unknown입니다.
