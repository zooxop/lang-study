import Foundation

func solution(_ new_id:String) -> String {
    var temp = Array(new_id.lowercased())  // 1단계(소문자로 치환)
    var answer = [String]()
    
    // 2단계([알파벳, 숫자, '-', '_', '.']를 제외한 모든 문자 제거.)
    temp = temp.filter({ char in
        char == "-" || char == "_" || char == "." || char.isNumber || char.isLetter
    })
        
    // 3단계
    answer.append(temp[0].description)
    
    for i in 1..<temp.count {
        if !(temp[i] == "." && temp[i-1] == ".") {
            answer.append(temp[i].description)
        }
    }
    
    // 4단계
    if answer[0] == "." {
        if answer.count == 1 {
            answer.removeAll()
        } else {
            answer.removeFirst()
        }
    }

    if answer.count > 1 && answer.last! == "." {
        answer.removeLast()
    }
    
    // 5단계 (문자열이 비어있다면 "a" 대입)
    if answer.isEmpty {
        answer.append("a")
    }
    
    // 6단계
    while answer.count > 15 {
        answer.removeLast()
    }
    
    // 7단계
    while answer.count < 3 {
        answer.append(answer[answer.count-1])
    }
    
    if answer.first == "." {
        answer.removeFirst()
    }
    if answer.last == "." {
        answer.removeLast()
    }
    
    return answer.joined()
}


//print(solution("...!@BaT#*..y.abcdefghijklm"))  // "bat.y.abcdefghi"
//print(solution("z-+.^."))  // "z--"
//print(solution("=.="))   // "aaa"
//print(solution("123_.def")) // "123_.def"
//print(solution("abcdefghijklmn.p")) // "abcdefghijklmn"
