import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let lefts  = [1, 4, 7, -1]
    let both   = [2, 5, 8, 0]
    let rights = [3, 6, 9, -1]
    
    
    var tLeft = -1, tRight = -1
    var answer = ""
    
    for number in numbers {
        if lefts.contains(number) {
            answer += "L"
            tLeft = number
        } else if rights.contains(number) {
            answer += "R"
            tRight = number
        } else {
            var lDistance = -1, rDistance = -1
            
            if !lefts.contains(tLeft) {
                lDistance = abs(both.firstIndex(of: tLeft)! - both.firstIndex(of: number)!)
            } else {
                lDistance = abs(lefts.firstIndex(of: tLeft)! - both.firstIndex(of: number)!) + 1
            }
            
            if !rights.contains(tRight) {
                rDistance = abs(both.firstIndex(of: tRight)! - both.firstIndex(of: number)!)
            } else {
                rDistance = abs(rights.firstIndex(of: tRight)! - both.firstIndex(of: number)!) + 1
            }
    
            
            if lDistance < rDistance {
                answer += "L"
                tLeft = number
            } else if lDistance > rDistance {
                answer += "R"
                tRight = number
            } else {
                if hand == "left" {
                    answer += "L"
                    tLeft = number
                } else {
                    answer += "R"
                    tRight = number
                }
            }
        }
    }
    
    return answer
}

// LRLLLRLLRRL
// print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))

