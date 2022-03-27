/* 기본 데이터 타입 */
import UIKit

// Swift의 기본 데이터 타입
// Bool, Int, UInt, Float, Double, Character, String

// Bool
var someBool: Bool = true
someBool = false
//someBool = 0 이나 someBool = 1 등은 사용할 수 없음.

// Int
var someInt: Int = -100

// UInt(Unsigned Int)
var someUInt: UInt = 100

// Float
var someFloat: Float = 3.14
someFloat = 3

// Double
var someDouble: Double = 3.14

// Character
var someCharacter: Character = "🇰🇷"
someCharacter = "😀"
someCharacter = "가"
someCharacter = "A"
//someCharacter = "하하하" //Error
print(someCharacter)

// String
var someString: String = "하하하 😀 "
someString = someString + "웃으면 복이와요"
print(someString)
