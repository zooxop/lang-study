import UIKit

let age: Int = 10

"안녕하세요. 저는 \(age)살 입니다."

"안녕하세요. 저는 \(age+5)살 입니다."

print("안녕하세요. 저는 \(age+5)살 입니다.")

print("\n##################\n")

class Person {
    var name: String = "mch"
    var age: Int = 10
}

let mch: Person = Person()

print(mch)

print("\n##################\n")

dump(mch)
