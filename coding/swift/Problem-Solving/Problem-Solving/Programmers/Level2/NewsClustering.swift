import Foundation
func solution(_ _str1:String, _ _str2:String) -> Int {
    var multipleSet1 = [String]()
    var multipleSet2 = [String]()
    
    // 대문자로 변환, 문자만 추출해서 배열로 반환
    // let str1 = Array(_str1.uppercased()).filter { $0.isLetter || $0.isWhitespace }
    let str1 = Array(_str1.uppercased()).map { $0.isLetter ? $0 : " " }
    let str2 = Array(_str2.uppercased()).map { $0.isLetter ? $0 : " " }
    
    // 다중 집합 만들기
    for i in 0..<str1.count-1 {
        if !str1[i].isWhitespace && !str1[i+1].isWhitespace {
            multipleSet1.append(str1[i].description + str1[i+1].description)
        }
    }
    
    for i in 0..<str2.count-1 {
        if !str2[i].isWhitespace && !str2[i+1].isWhitespace {
            multipleSet2.append(str2[i].description + str2[i+1].description)
        }
    }

    var intersection = [String]()
    var union = [String]()
    
    var tempMul2 = multipleSet2
    
    // 교집합
    for i in 0..<multipleSet1.count {
        if tempMul2.contains(multipleSet1[i]) {
            intersection.append(multipleSet1[i])
            tempMul2.remove(at: tempMul2.firstIndex(of: multipleSet1[i])!)
        }
    }
    
    // 합집합
    for i in 0..<multipleSet1.count {
        if multipleSet2.contains(multipleSet1[i]) {
            multipleSet2.remove(at: multipleSet2.firstIndex(of: multipleSet1[i])!)
        }
    }
    union = multipleSet1
    union.append(contentsOf: multipleSet2)
    
    if intersection.count == 0 && union.count == 0 {
        return 65536
    } else if intersection.count == 0 && union.count > 0 {
        return 0
    } else {
        if intersection.count > union.count {
            return Int((Double(union.count) / Double(intersection.count)) * 65536)
        } else {
            return Int((Double(intersection.count) / Double(union.count)) * 65536)
        }
        
    }
}

//// 16384
//print(solution("FRANCE", "french"))
//
//// 65536
//print(solution("handshake", "shake hands"))
//
//// 43690
//print(solution("aa1+aa2", "AAAA12"))
//
//// 65536
//print(solution("E=M*C^2", "e=m*c^2"))
//
//// 0
//print(solution("A+C", "DEF"))
