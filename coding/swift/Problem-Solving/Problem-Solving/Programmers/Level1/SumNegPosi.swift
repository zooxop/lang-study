import Foundation
func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0
    
    for i in 0..<absolutes.count {
        answer += (signs[i] == true) ? absolutes[i] : -absolutes[i]
    }
    return answer
}
//
//print(solution([4, 7, 12], [true, false, true]))  // 9
//print(solution([1, 2, 3], [false, false, true]))  // 0
