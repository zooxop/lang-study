import Foundation
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var arr = [String]()
    var answer = ""
    
    for i in 0..<(t*m) {
        arr.append(contentsOf: String(i, radix: n).map { $0.description })
        
        if i % m == (p-1) {
            answer += arr[i]
        }
        if answer.count == t {
            break
        }
    }
    
    return answer.uppercased()
}
//
//print(solution(2, 4, 2, 1))
//print(solution(16, 16, 2, 1))
