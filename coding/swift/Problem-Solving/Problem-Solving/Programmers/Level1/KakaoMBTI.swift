//
//  KakaoMBTI.swift
//  Problem-Solving
//
//  Created by 문철현 on 2022/09/21.
//

import Foundation
func solution(_ survey:[String], _ choices:[Int]) -> String {
    // [R, T], [C, F], [J, M], [A, N]
    let category = ["R", "T", "C", "F", "J", "M", "A", "N"]
    var scores: [String:Int] = [:]
    var answer = ""
    
    for c in category {
        scores[c] = 0
    }
    
    for (idx, value) in survey.enumerated() {
        let first = value.first!.description
        let second = value[value.index(value.startIndex, offsetBy: 1)].description
        
        if choices[idx] < 4 {
            scores[first]! += (4 - choices[idx])
        } else if choices[idx] > 4 {
            scores[second]! += (choices[idx] - 4)
        }
    }
    
    scores["R"]! >= scores["T"]! ? answer.append("R") : answer.append("T")
    scores["C"]! >= scores["F"]! ? answer.append("C") : answer.append("F")
    scores["J"]! >= scores["M"]! ? answer.append("J") : answer.append("M")
    scores["A"]! >= scores["N"]! ? answer.append("A") : answer.append("N")


    return answer
}

// print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))  // "TCMA"
