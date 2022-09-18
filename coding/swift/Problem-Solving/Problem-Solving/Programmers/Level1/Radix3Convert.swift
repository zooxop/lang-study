import Foundation

func solution(_ n:Int) -> Int {
    var answer = ""
    let radix = Array(String(n, radix: 3))
    
    for char in radix.reversed() {
        answer += char.description
    }
    
    return Int(answer, radix: 3)!
}

//print(solution(45))  // 7
//print(solution(125))  // 229
