import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let rank = [6, 6, 5, 4, 3, 2, 1]
    
    let cnt_0 = lottos.filter({ $0 == 0 }).count
    var answer = 0
    
    for x in win_nums {
        if lottos.contains(x) {
            answer += 1
        }
    }
    
    return [rank[cnt_0 + answer], rank[answer]]
}


print(solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]))  // [3, 5]
print(solution([0, 0, 0, 0, 0, 0], [38, 19, 20, 40, 15, 25]))  // [1, 6]
print(solution([45, 4, 35, 20, 3, 9], [20, 9, 3, 45, 4, 35]))   // [1, 1]
