import Foundation

func solution(_ numbers:[Int]) -> Int {
    return 45 - numbers.reduce(0) { $0 + $1 }
}

//print(solution([1,2,3,4,6,7,8,0]))  // 14
//print(solution([5,8,4,0,6,7,9]))  // 6
