import Foundation

func binary_search(array: [Int], target: Int) -> Int? {
    var mid = 0, start = 0
    var end = array.count - 1
    
    while start <= end {
        mid = (start + end) // 2  # 절반에 해당하는 index값

        if array[mid] == target {
            // 원하는 값 찾은 경우 인덱스 반환
            return mid
        } else if array[mid] > target {
            // 원하는 값이 중간점의 값보다 작은 경우 왼쪽 부분(절반의 왼쪽 부분) 확인
            end = mid - 1
        } else {
            // 원하는 값이 중간점의 값보다 큰 경우 오른쪽 부분(절반의 오른쪽 부분) 확인
            start = mid + 1
        }
    }
        
    return nil
}
    
let numbers = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
let target = 7

//if let hasValue = binary_search(array: numbers, target: target) {
//    print("인덱스 :", hasValue)
//} else {
//    print("찾을 수 없음.")
//}

// 출력
// 인덱스 : 3
