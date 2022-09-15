import Foundation
func solution(_ num:Int) -> Int {
    var temp = num
    for i in 0..<500 {
        if temp == 1 {
            return i
        }
        
        if temp % 2 == 0 {
            temp /= 2
        } else {
            temp = (temp * 3) + 1
        }
    }
    return -1
}

//print(solution(6))  // 8
//print(solution(16))  // 4
//print(solution(626331))  // -1
