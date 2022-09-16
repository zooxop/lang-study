import Foundation

func gcd(_ n: Int, _ m: Int) -> Int {
    var (a, b, r) = (n, m, 1)
    
    while(a % b != 0) {
        r = a % b;
        a = b;
        b = r;
    }
    
    return b
}

func solution(_ n:Int, _ m:Int) -> [Int] {
    let value = gcd(n, m)
    
    return [value, ((n*m) / value)]
}

//print(solution(3, 12))  // [3, 12]
//print(solution(2, 5))  // [1, 10]
