import Foundation
func solution(_ record:[String]) -> [String] {
    var answer = [[String]]()
    var userDict = [String:String]()
    
    for record in record {
        let info = record.components(separatedBy: " ")
        
        if info[0] == "Leave" {
            answer.append([info[1], "님이 나갔습니다."])
        } else {
            userDict[info[1]] = info[2]
            
            if info[0] == "Enter" {
                answer.append([info[1], "님이 들어왔습니다."])
            }
        }
    }
    
    for i in 0..<answer.count {
        answer[i][0] = userDict[answer[i][0]]!
    }
    
    return answer.map{ $0[0] + $0[1] }
}

// ["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]
// print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
