import Foundation
func solution(_ msg:String) -> [Int] {
    var message = Array(msg).map{ $0.description }
    var dict = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { $0.description }
    var input = ""
    var answer = [Int]()
    
    while !message.isEmpty {
        input += message.removeFirst()
        
        if dict.contains(input) {
            continue
        } else {
            dict.append(input)
            let temp = input.popLast()
            
            if let idx = dict.firstIndex(of: input) {
                answer.append(idx+1)
            }
            
            input = temp!.description
        }
    }
    
    if !input.isEmpty {
        answer.append(dict.firstIndex(of: input)!+1)
    }
    
    return answer
}

//print(solution("KAKAO"))
