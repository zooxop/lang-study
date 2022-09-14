import Foundation


// 누적합 문제
func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let N = board.count
    let M = board[0].count
    var array: [[Int]] = Array.init(repeating: Array.init(repeating: 0, count: M+2), count: N+2)
    var result = 0
    
    for temp in skill {
        // type, r1, c1, r2, c3, degree
        let type = temp[0]
        let r1 = temp[1]
        let c1 = temp[2]
        let r2 = temp[3]
        let c2 = temp[4]
        var degree = temp[5]
        
        if type == 1 {  // attack 일 때
            degree = -degree
        }
        
        // 누적합 기준값 할당 (변화량을 누적)
        array[r1+1][c1+1] += degree
        array[r2+2][c1+1] -= degree
        array[r1+1][c2+2] -= degree
        array[r2+2][c2+2] += degree
    }
    
    // 누적합 계산
    for i in 1...N {
        for j in 1...M {
            array[i][j] = array[i][j] + array[i-1][j] + array[i][j-1] - array[i-1][j-1]
        }
    }
    
    // 건물 파괴 여부 체크
    for i in 0..<N {
        for j in 0..<M {
            if (board[i][j] + array[i+1][j+1]) > 0 {
                result += 1  // 파괴되지 않았다면 +1
            }
        }
    }
    
    return result
}


//// 10
//print(solution([[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]], [[1,0,0,3,4,4],[1,2,0,2,3,2],[2,1,0,3,1,2],[1,0,1,3,3,1]]))
//
//// 6
//print(solution([[1,2,3],[4,5,6],[7,8,9]], [[1,1,1,2,2,4],[1,0,0,1,1,2],[2,2,0,2,0,100]]))
