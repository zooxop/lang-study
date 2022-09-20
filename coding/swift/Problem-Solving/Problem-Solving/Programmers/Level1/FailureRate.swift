import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var array = Array(repeating: 0, count: N)
    var lefted = Array(repeating: 0, count: N)
    
    var failureRate: [Double] = Array(repeating: 0, count: N)

    // (index - 1)번 stage에 남아있는 사람들 수
    // e.x.) [1, 3, 2, 1, 0]
    for stage in stages {
        if stage <= N {
            array[stage-1] += 1
        }
    }
    
    // (index - 1)번 stage의 총 도전자 수
    // e.x.) [8, 7, 4, 2, 1]
    lefted[0] = stages.count
    for i in 1..<lefted.count {
        lefted[i] = lefted[i-1] - array[i-1]
    }
    
    // (index - 1)번 stage의 실패율 = [array[0] / lefted[0], array[1] / lefted[1] ...]
    // e.x.) [1/8, 3/7, 2/4, 1/2, 0/1]
    for i in 0..<failureRate.count {
        failureRate[i] = Double(array[i]) / Double(lefted[i])
    }
    
    // 값을 내림차순으로 정렬한 리스트에 대해, 원소를 index+1 해준 값으로 변환하여 리턴.
    return failureRate.enumerated().sorted{ $0.element > $1.element }.map{ $0.offset+1 }
}

// print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))  // [3, 4, 2, 1, 5]
