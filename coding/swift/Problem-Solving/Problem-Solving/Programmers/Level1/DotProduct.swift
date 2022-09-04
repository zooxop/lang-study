import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var sum = 0
    for i in 0..<a.count {
        sum += (a[i] * b[i])
    }
    return sum
}

//print(solution([1, 2, 3, 4], [-3, -1, 0, 2]))  // 3
//print(solution([-1, 0, 1], [1, 0, -1]))  // -2
