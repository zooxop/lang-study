import Foundation

func solution(_ dartResult:String) -> Int {
    let values = Array(dartResult)
    
    var lastNumIdx = 0
    var results = Array(repeating: 0, count: 3)
    
    for i in 0..<values.count {
        
        if !(values[i].isNumber) && values[i] != "*" && values[i] != "#" {
            var temp = 0
            
            if values[i-1] == "0" && i >= 2 && values[i-2] == "1" {
                temp = 10
            } else {
                temp = values[i-1].wholeNumberValue!
            }
            
            if values[i] == "S" {
                results[lastNumIdx] = temp
            } else if values[i] == "D" {
                results[lastNumIdx] = (temp * temp)
            } else if values[i] == "T" {
                results[lastNumIdx] = (temp * temp * temp)
            }
            
            lastNumIdx += 1
        } else {
            if values[i] == "*" {
                results[lastNumIdx-1] *= 2
                
                if lastNumIdx >= 2 {
                    results[lastNumIdx-2] *= 2
                }
            } else if values[i] == "#" {
                results[lastNumIdx-1] *= -1
            }
        }
    }
    
    return results.reduce(0) { $0 + $1 }
}

//print(solution("1S2D*3T"))  // 37
//print(solution("1D2S#10S"))  // 9
//print(solution("1D2S0T"))  // 3
//print(solution("1S*2T*3S"))  // 23
//print(solution("1D#2S*3S"))  // 5
//print(solution("1T2D3D#"))  // -4
//print(solution("1D2S3T*"))  // 59
