import Foundation

func isPrime(num: Int) -> Bool {
    if (num < 4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}


func solution(_ n:Int, _ k:Int) -> Int {
    // 진수 변환
    let radix = String(n, radix: k)
    
    var tempIdx = 0
    var count = 0
    
    let array = String(radix).split(separator: "0")
    
    array.map {
        if isPrime(num: Int($0)!) {
            count += 1
        }
    }
    
    return count
}

//print(solution(437674, 3))  // 3
//print(solution(110011, 10))  // 2
