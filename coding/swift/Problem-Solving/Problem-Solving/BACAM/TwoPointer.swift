import Foundation

func twoPointer(array: [Int], M: Int) -> Int {
    let N = array.count  // 데이터의 개수
    
    var count = 0
    var intervalSum = 0
    var end = 0
    
    // start를 1씩 증가시키면서 반복
    for start in 0..<N {
        // end만큼 오른쪽으로 이동
        while intervalSum < M && end < N {
            intervalSum += array[end]
            end += 1
        }
        
        // 부분합이 M일 때 count++
        if intervalSum == M {
            count += 1
        }
        
        // start를 1 증가시키기 전에, 더했던 값을 빼준다.
        intervalSum -= array[start]
    }
    
    return count
}

// print("합이 5인 구간의 개수:", twoPointer(array: [1, 2, 3, 2, 5], M: 5))

// 출력:
// 합이 5인 구간의 개수: 3
