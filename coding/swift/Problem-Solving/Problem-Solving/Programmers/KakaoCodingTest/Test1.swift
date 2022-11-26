// 1. [main.swift] 파일에서 문제 풀이.
// 2. 풀이 완료 후, BOJ 또는 Programmers 폴더에 새로운 파일을 생성하여 코드 이관.
// 3. 2번 작업 완료 후 [main.swift]의 코드를 아래 코드로 변경.

//import Foundation
//print("Hello, World!")

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var termArr = [[String]]()
    var termDict = [String:String]()
    var answer = [Int]()
    
    for i in 0..<terms.count {
        termArr.append(terms[i].components(separatedBy: " "))
        termDict[termArr[i][0]] = termArr[i][1]
    }
    
    for i in 0..<privacies.count {
        let temp = privacies[i].components(separatedBy: " ")
        let sep = temp[0].components(separatedBy: ".")
        
        var year = Int(sep[0])!
        var month = (Int(sep[1])! + Int(termDict[temp[1]]!)!)
        
        if month > 12 {
            year = year + ((month / 12))
            month = (month % 12)
        }
        
        if month <= 0 {
            month = 12
            year = year - 1
        }
        
        var date = 0
        if sep[2] == "01" {
            month = month - 1
            if month <= 0 {
                year = year - 1
                month = 12
            }
            date = 28
        } else {
            date = Int(sep[2])! - 1
        }
        
        print(year, month, date)
        
        let tday = today.components(separatedBy: ".").map { Int($0)! }
        
        if tday[0] > year {
            answer.append(i+1)
        } else if tday[0] == year {
            if tday[1] > month {
                answer.append(i+1)
            } else if tday[1] == month {
                if tday[2] > date {
                    answer.append(i+1)
                }
            }
        }
    }
    
    return answer
}


// [1, 3]
// print(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]))
////
//print(solution("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"]))
//
//print(solution("2020.01.01", ["D 36", "Z 12"], ["2019.01.01 D", "2018.12.28 Z"]))
