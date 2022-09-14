import Foundation

var maxDiff = 0
var answer: [Int] = [-1]

func isBetter(ryan: [Int]) -> Bool {
    // 현재 갖고 있는 answer의 상태와, 계산중인 ryan의 상태를 비교하여 어느쪽이 더 총점이 높은지 비교한다.
    for i in (0...10).reversed() {
        if ryan[i] > answer[i] {
            return true
        } else if ryan[i] < answer[i] {
            return false
        }
    }
    return false
}

func calcScore(ryan: [Int], apeach: [Int]) {
    var ryanScore = 0, apeachScore = 0
    
    for i in 0..<11 {
        if ryan[i] > apeach[i] {  // 라이언이 더 많이 맞췄을 때만 점수를 가져감.
            ryanScore += 10-i
        } else if apeach[i] > 0 {  // 맞춘 화살 갯수가 같거나, 혼자 맞췄을때는 어피치가 점수를 가져감.
            apeachScore += 10-i
        }
    }
    
    // max값 계산
    // "라이언은 어피치를 '가장 큰 점수 차이'로 이기기 위해서 ..." (문제 조건 중 ...)
    let diff = ryanScore - apeachScore
    if diff > 0 && diff >= maxDiff {
        // diff 값이 같으면서 / answer의 상태가 현재 ryan의 상태보다 더 총점이 높다면
        if maxDiff == diff && !isBetter(ryan: ryan) {
            return  // 값을 교체할 필요가 없으므로 종료.
        }
        
        maxDiff = diff
        answer = ryan  // 현재상태(최선의 상태)의 리스트를 answer에 대입.
    }
}

// 완전 탐색 (재귀) (브루트 포스)
func solve(_ idx: Int, _ arrows: Int, _ ryan: inout [Int], _ apeach: [Int]) {
    if idx == 11 || arrows == 0 {  // 마지막인 경우
        ryan[10] += arrows  // 남은 화살 모두 0점 과녁에 대입
        calcScore(ryan: ryan, apeach: apeach)
        ryan[10] -= arrows
        return
    }
    
    // 어피치가 맞춘 갯수보다 남은 화살이 많은 경우, 점수를 얻는것이 유리하다.
    if apeach[idx] < arrows {
        ryan[idx] += apeach[idx]+1  // 어피치보다 1개 더 맞췄다고 가정.
        solve(idx+1, arrows-apeach[idx]-1, &ryan, apeach)  // 재귀
        ryan[idx] -= apeach[idx]+1  // 다시 원위치
    }
    
    // 점수를 얻지 않는 경우도 재귀로 탐색하여, 완전 탐색 구현.
    solve(idx+1, arrows, &ryan, apeach)
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var ryan: [Int] = Array.init(repeating: 0, count: 11)
    solve(0, n, &ryan, info)
    
    return answer
}


//// [0,2,2,0,1,0,0,0,0,0,0]
//print(solution(5, [2,1,1,1,0,0,0,0,0,0,0]))
//
//// [-1]
//print(solution(1, [1,0,0,0,0,0,0,0,0,0,0]))
//
//// [1,1,2,0,1,2,2,0,0,0,0]
//print(solution(9, [0,0,1,2,0,1,1,1,1,1,1]))
//
//// [1,1,1,1,1,1,1,1,0,0,2]
//print(solution(10, [0,0,0,0,0,0,0,0,3,4,3]))
