import Foundation
func solution(_ strings:[String], _ n:Int) -> [String] {
    var dict = [String: Array<String>]()
    var answer = [String]()

    for string in strings {
        let idx = string.index(string.startIndex, offsetBy: n)
        let char = string[idx].description
        
        if dict[char]?.isEmpty == nil {
            dict[char] = []
        }
        
        dict[char]?.append(string)
    }
    
    for temp in dict.sorted { $0.key < $1.key } {
        for word in temp.value.sorted() {
            answer.append(word)
        }
    }
    
    return answer
}

//print(solution(["sun", "bed", "car"], 1))  // ["car", "bed", "sun"]
//print(solution(["bed", "sun", "car"], 1))  // ["car", "bed", "sun"]
//print(solution(["abce", "abcd", "cdx"], 2))  // ["abcd", "abce", "cdx"]
