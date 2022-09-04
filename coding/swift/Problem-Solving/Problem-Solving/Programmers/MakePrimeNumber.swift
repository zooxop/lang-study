import Foundation

var count: Int = 0
var arr = [Int]()

func dfs(_ nums: [Int], _ idx: Int, _ len: Int) {
    if len == 3 {
        let sum = arr.reduce(0) { $0 + $1 }
        if isPrime(sum) {
            count += 1
        }
        return
    }
    
    for i in idx..<nums.count {
        if len < 3 {
            arr.append(nums[i])
            dfs(nums, i+1, len+1)
            arr.removeLast()
        }
    }
}

func isPrime(_ value: Int) -> Bool {
    for i in 2..<value {
        if value % i == 0 {
            return false
        }
    }
    return true
}

func solution(_ nums:[Int]) -> Int {
    count = 0
    dfs(nums, 0, 0)
    
    return count
}

//
//print(solution([1, 2, 3, 4]))
//print(solution([1, 2, 7, 6, 4]))
