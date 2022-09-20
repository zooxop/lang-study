// 1. [main.swift] 파일에서 문제 풀이.
// 2. 풀이 완료 후, BOJ 또는 Programmers 폴더에 새로운 파일을 생성하여 코드 이관.
// 3. 2번 작업 완료 후 [main.swift]의 코드를 아래 코드로 변경.

//import Foundation
//print("Hello, World!")

import Foundation

func solution(_ s:String) -> Int {
    var answer = ""
    var temp = ""
    
    for word in Array(s) {
        if word.isNumber {
            answer += word.description
        } else {
            temp += word.description
            var isRemove = true
            
            switch temp {
            case "zero" :
                answer += "0"
            case "one" :
                answer += "1"
            case "two" :
                answer += "2"
            case "three" :
                answer += "3"
            case "four" :
                answer += "4"
            case "five" :
                answer += "5"
            case "six" :
                answer += "6"
            case "seven" :
                answer += "7"
            case "eight" :
                answer += "8"
            case "nine" :
                answer += "9"
            default:
                isRemove = false
            }
            
            if isRemove {
                temp = ""
            }
        }
    }
    
    return Int(answer)!
}

print(solution("one4seveneight"))
print(solution("23four5six7"))
print(solution("2three45sixseven"))
print(solution("123"))
