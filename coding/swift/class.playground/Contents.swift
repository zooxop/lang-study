/* 클래스 */

import Swift

// MARK: - 정의
//class 이름 {
//  /* 구현부 */
//}

// Struct(구조체) 와 다른점
//  - 구조체는 "값" 타입인 반면, 클래스는 "참조" 타입이다.

// Swift의 클래스는 다중상속을 지원하지 않는다.


// MARK: 프로퍼티 및 메서드

class Sample {
    var mutableProperty: Int = 100  // 가변 프로퍼티
    let immutableProperty: Int = 100 // 불변 프로퍼티
    
    static var typeProperty: Int = 100 // 타입 프로퍼티
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    //재정의 가능 타입 메서드 - class
    // 상속을 받을 때 재정의가 가능하다.
    class func classMethod() {
        print("type method - class")
    }
}

// MARK: 클래스 사용

var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200
// mutableReference.immutableProperty = 200 // Error. 상수로 선언되어 있기 때문에 수정할 수 없음.

let immutableReference: Sample = Sample()

immutableReference.mutableProperty = 200  //불변 인스턴스로 선언했기때문에 구조체였다면 Error가 발생 했겠지만, 클래스는 Error가 발생하지 않음.
// immutableReference.immutableProperty = 200 // 그래도 이건 Error난다.


// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod()  // type Method

// mutableReference.typeProperty = 400 // Error. Type property값은 인스턴스에서 수정 할 수 없음.
// mutableReference.typeMethod()  //Error. Type Method는 인스턴스에서 호출할 수 없음.

// MARK: - 학생 클래스

class Student {
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    class func selfIntroduce() {
        print("학생 타입입니다.")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다.")
    }
}

Student.selfIntroduce()  //출력 : 학생 타입입니다.

var yagom: Student = Student()
yagom.name = "yagom"
yagom.class = "스위프트"
yagom.selfIntroduce()  // 출력 : 저는 스위프트반 yagom입니다.

let jina: Student = Student()
jina.name = "jina"
jina.selfIntroduce() // 출력 : 저는 Swift반 jina입니다.

