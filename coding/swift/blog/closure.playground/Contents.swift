import UIKit

let source = ["apple", "air", "brown", "red", "orange", "blue", "candy"]


// 1. 특정 알파벳이 들어있는 문자열을 반환해주는 클로저
let containsSomeText: (String, String) -> Bool = { name, find in
    if name.contains(find) {
        return true
    }
    return false
}

// 2. 특정 알파벳으로 "시작하는" 문자열을 반환해주는 클로저
let isStartSomeText: (String, String) -> Bool = { name, find in
    if name.first?.description == find {
        return true
    }
    return false
}


// 클로저를 사용하는 함수
func someFind(names: [String], find: String, condition: (String, String) -> Bool) -> [String] {
    var newNames = [String]()
    
    for name in names {
        if condition(name, find) {
            newNames.append(name)
        }
    }
    
    return newNames
}

// "a"가 들어있는 문자열을 반환받음
someFind(names: source, find: "a", condition: containsSomeText)  // ["apple", "air", "orange", "candy"]
// "a"로 시작하는 문자열을 반환받음
someFind(names: source, find: "a", condition: isStartSomeText)  // ["apple", "air"]



var fruits = ["Apple", "Grape", "Melon", "Banana", "Mango"]


fruits.sort()  // return X, 원본 상태 변경 O
//["Apple", "Banana", "Grape", "Mango", "Melon"]

fruits.sorted()  // return O, 원본 상태 변경 X

// 기본형
fruits.sort { (lhs, rhs) -> Bool in
    return lhs > rhs  // 내림차순
}

// 축약형
// case 1
fruits.sort(by: { $0 < $1 } )

// case 2
fruits.sort() { $0 < $1 }

// case 3
fruits.sort { $0 < $1 }

// case 4
fruits.sort(by: <)
