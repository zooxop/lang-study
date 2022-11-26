// 1. [main.swift] 파일에서 문제 풀이.
// 2. 풀이 완료 후, BOJ 또는 Programmers 폴더에 새로운 파일을 생성하여 코드 이관.
// 3. 2번 작업 완료 후 [main.swift]의 코드를 아래 코드로 변경.

//import Foundation
//print("Hello, World!")

import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var discountedPrice = [[Int]]()
    let discountPercent = [0.9, 0.8, 0.7, 0.6]
    let discountRate = [10, 20, 30, 40]
    
    for i in 0..<emoticons.count {
        var temp = [Int]()
        for j in 0..<4 {
            temp.append(Int(Double(emoticons[i]) * discountPercent[j]))
        }
        discountedPrice.append(temp)
    }
    
    print(discountedPrice)
    
    for user in users {
        let userRate = user[0]
        let userCash = user[1]
        let maxIdx = (userRate/10) - 1
        var tempUserPlus = false
        
        for i in (maxIdx..<4).reversed() {
            var pay = 0
            for j in 0..<emoticons.count {
                for k in i..<4 {
                    pay += discountedPrice[j][k]
                }
                print(pay)
            }
            // print(pay)
            if pay >= userCash {
                tempUserPlus = true
                break
            }
        }
        break
    }
    
    return []
}

// [1, 5400]
// print(solution([[40, 10000], [25, 10000]], [7000, 9000]))
print(solution([[25, 10000], [40, 10000]], [7000, 9000]))
