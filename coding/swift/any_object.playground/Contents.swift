/* Any, AnyObject, nil */
import UIKit

/*
  Any - Swift의 모든 타입을 지칭하는 키워드
  AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
  nil - 없음을 의미하는 키워드
 */

// MARK: - Any
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능합니다."
someAny = 123.12

//let someDouble: Double = someAny  //Error. 'Any'를 Double이나 Int등 지정된 타입의 변수에 대입할 수 없다.

// 반대(Specified type -> Any)는 가능하다.
let someDouble: Double = 123.45
someAny = someDouble

class someClass {}


// MARK: - AnyObject
var someAnyObject: AnyObject = someClass()
// someAnyObject = 123.12  //Error.



// MARK: - nil
//someAny = nil  //Error.
//someAnyObject = nil  //Error.  Any와 AnyObject는 "nil"을 받을 수 없다.
