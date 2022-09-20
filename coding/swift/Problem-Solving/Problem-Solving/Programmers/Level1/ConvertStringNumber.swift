import Foundation

func solution(_ s:String) -> Int {
    // 1. 이렇게 풀거나
    // 2. 딕셔너리로 풀거나
    // 3. replacingOccurrences(of: "four", with: "4") 로 풀거나
    
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

//print(solution("one4seveneight"))
//print(solution("23four5six7"))
//print(solution("2three45sixseven"))
//print(solution("123"))
