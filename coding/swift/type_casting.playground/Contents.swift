/* 타입 캐스팅 */

// 스위프트의 타입캐스팅은, 인스턴스의 타입을 확인하는 용도 또는
// 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지
// 확인하는 용도로 사용한다.
// is, as 키워드를 사용한다.

import Swift

/*
 let someInt: Int = 100
 let someDouble: Double = Double(someInt)  // 이 방식은 실질적으로 type-casting 이 아니다. 단지 Double 타입의 인스턴스를 새로 만들어서 할당해주는 것 뿐이다.
 */


// 타입 캐스팅을 위한 클래스 정의
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다.")
    }
}

class Student: Person {
    var school = ""
    func goToSchool() {
        print("등교를 합니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다. 신난다!")
    }
}

var yagom: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()


// MARK: - 타입 확인
// is를 사용하여 타입을 확인한다.

var result: Bool

result = yagom is Person  // true
result = yagom is Student  // false
result = yagom is UniversityStudent  // false

result = hana is Person // true
result = hana is Student // true
result = hana is UniversityStudent // true

result = jason is Person  // true
result = jason is Student  // true
result = jason is UniversityStudent // true

if yagom is UniversityStudent {
    print("yagom은 대학생입니다.")
} else if yagom is Student {
    print("yagom은 학생입니다.")
} else if yagom is Person {
    print("yagom은 사람입니다.")
}  // 출력 : yagom은 사람입니다.

switch jason {
case is Person:
    print("jason은 사람입니다.")
case is Student:
    print("jason은 학생입니다.")
case is UniversityStudent:
    print("jason은 대학생입니다.")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다.")
}  // jason은 사람입니다.

switch jason {
case is UniversityStudent:
    print("jason은 대학생입니다.")
case is Student:
    print("jason은 학생입니다.")
case is Person:
    print("jason은 사람입니다.")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다.")
}  // jason은 대학생입니다.


// MARK: - 업 캐스팅
// as를 사용하여 부모클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 타입정보를 반환해준다.
// Any 혹은 AnyObject 로도 타입정보를 변환할 수 있다.
// 암시적으로 처리되므로, 생략해도 무방하다.

var mike: Person = UniversityStudent() as Person
var jenny: Student = Student()
// var jina: UniversityStudent = Person() as UniversityStudent  // 컴파일 오류.
var jina: Any = Person()  // as Any 생략 가능.


// MARK: - 다운 캐스팅
// as? 또는 as!를 사용하여
// 자식 클래스의 인스턴스로 사용할 수 있도록
// 컴파일러에게 인스턴스의 타입정보를 전환해준다.

// MARK: - 조건부 다운 캐스팅
// as?

var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil

// MARK: - 강제 다운 캐스팅
// as!

var forcedCasted: Student

forcedCasted = mike as! UniversityStudent
// forcedCasted = jenny as! UniversityStudent  // 런타임 오류 발생
// forcedCasted = jina as! UniversityStudent  // 런타임 오류 발생
// forcedCasted = jina as! Student  // 런타임 오류 발생


// 활용
func doSomethingWithSwitch(someone: Person){
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person)
// 출력 : 멤버쉽 트레이닝을 갑니다. 신난다!

doSomethingWithSwitch(someone: mike)
// 출력 : 멤버쉽 트레이닝을 갑니다. 신난다!

doSomethingWithSwitch(someone: jenny)
// 출력 : 등교를 합니다.


func doSomething(someone: Person){
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person)
// 출력 : 멤버쉽 트레이닝을 갑니다. 신난다!

doSomething(someone: mike)
// 출력 : 멤버쉽 트레이닝을 갑니다. 신난다!

doSomething(someone: jenny)
// 출력 : 등교를 합니다.

doSomething(someone: yagom)
// 출력 : 숨을 쉽니다. 
