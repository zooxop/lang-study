import Foundation
// 빈공간 : *
func dropBlocks(_ m:Int, _ n:Int, _ board:[[String]]) -> [[String]] {
    var temp = board
    
    for i in (1..<m).reversed() {
        for j in 0..<n {
            if temp[i][j] == "*" {
                for x in (0..<i).reversed() {
                    if temp[x][j] != "*" {
                        let word = temp[x][j]
                        temp[x][j] = "*"
                        temp[i][j] = word
                        break
                    }
                }
            }
        }
    }
        
    return temp
}

// 블록 삭제 처리
func setNewBoard(_ m:Int, _ n:Int, _ board: inout [[String]]) -> Int {
    var isChecks = Array(repeating: Array(repeating: false, count: n), count: m)
    var disapearCount = 0
    
    for i in 0..<m-1 {
        for j in 0..<n-1 {
            if board[i][j] != "*" {
                let char = board[i][j]
                if char == board[i+1][j] && char == board[i][j+1] && char == board[i+1][j+1] {
                    isChecks[i][j] = true
                    isChecks[i+1][j] = true
                    isChecks[i][j+1] = true
                    isChecks[i+1][j+1] = true
                }
            }
        }
    }
    
    for i in 0..<m {
        for j in 0..<n {
            if isChecks[i][j] == true {
                board[i][j] = "*"
                disapearCount += 1
            }
        }
    }
    
    return disapearCount
}

func solution(_ m:Int, _ n:Int, _ _board:[String]) -> Int {
    var board = [[String]]()
    var disapearCount = 0
    
    for i in 0..<m {
        board.append(_board[i].map{ $0.description })
    }

    while true {
        let temp = setNewBoard(m, n, &board)
        if temp > 0 {
            disapearCount += temp
            board = dropBlocks(m, n, board)
        } else {
            break
        }
        
    }
    
    return disapearCount
}

// 14
// print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]))
