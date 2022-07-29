import UIKit

var greeting = "Hello, playground"


var year = "2022"
var birthYear: Int = 1996

// year - birthYear  // 에러 발생.
(Int(year) ?? 0) - birthYear
(year as NSString).integerValue - birthYear

Int(year) ?? 0

// to-do :
// - String to int가 그냥 안되는 이유 찾아보기
// - String to int(또는 Double 등) 를 할 수 있는 여러 예시 찾아보기.
// - 여기에, String 사용방법 예시 몇개와 유니코드 내용 살 붙이기


// Double, Int 의 형변환 예시
var test: Double = 6.0
var intTest: Int = 10


// print(intTest + test)  // 에러 발생.
print(intTest + Int(test))


let stringValue = "10"
let integer1 = Int(stringValue)
var integer2 = Int(stringValue)
var integer3: Int? = Int(stringValue)


var intValue: Int = Int(123.75)
var price: Int = 100
var totalPrice = Double(price) * 1.1
print(totalPrice)


//var integer_: Int = 10
//var double_: Double = Double(integer_)
//var ststst: String = String(integer_)

//var strValue: String = "10"
//var doubleValue: Double = 10.0
//var integer_: Int = Int(doubleValue)
//var tstst = Int(strValue)

var strValue: String = "10"
var integer_: Int? = Int(strValue)  // 정상 동작.

print(integer_)  // 출력: Optional(10)


strValue = "10원"
integer_ = Int(strValue)

print(integer_)  // 출력: nil

