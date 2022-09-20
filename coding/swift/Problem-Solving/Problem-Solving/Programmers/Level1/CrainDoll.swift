import Foundation
func solution(_ _board:[[Int]], _ moves:[Int]) -> Int {
    let depth = _board.count
    var board = _board
    var bascket: [Int] = []
    var answer = 0
    
    for move in moves {
        for i in 0..<depth {
            if board[i][move-1] != 0 {
                bascket.append(board[i][move-1])
                board[i][move-1] = 0
                break
            }
        }
        if bascket.count >= 2 {
            if bascket[bascket.count-1] == bascket[bascket.count-2] {
                bascket.removeLast()
                bascket.removeLast()
                answer += 2
            }
        }
    }
    
    return answer
}

// 4
// print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
