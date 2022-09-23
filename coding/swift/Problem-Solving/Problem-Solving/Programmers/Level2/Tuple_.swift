import Foundation
func solution(_ s:String) -> [Int] {
    var temp = s.components(separatedBy: "},")
    var intArr = [[Int]]()
    var answer = [Int]()
    
    for i in 0..<temp.count {
        temp[i] = temp[i].replacingOccurrences(of: "{", with: "")
        temp[i] = temp[i].replacingOccurrences(of: "}", with: "")
    }
    temp.sort{ return $0.count < $1.count }
    
    for i in 0..<temp.count {
        intArr.append(temp[i].components(separatedBy: ",").map{ Int($0)! })
    }
    
    for value in intArr {
        for i in 0..<value.count {
            if !answer.contains(value[i]) {
                answer.append(value[i])
            }
        }
    }
    
    return answer
}

// [2, 1, 3, 4]
//print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
//
//print(solution("{{1,2,3},{2,1},{1,2,4,3},{2}}"))
