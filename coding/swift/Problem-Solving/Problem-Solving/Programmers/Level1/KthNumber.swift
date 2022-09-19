import Foundation
func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    
    for com in commands {
        let temp = array[com[0]-1..<com[1]].sorted()
        answer.append(temp[com[2]-1])
    }
    
    return answer
}

// print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))  // [5, 6, 3]
