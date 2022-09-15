import Foundation
func solution(_ n:Int64) -> Int64 {
    var temp = String(n).map{String($0)}.sorted(by: >)
    
    return Int64(temp.joined())!
}

//print(solution(118372))  // 873211
