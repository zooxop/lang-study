import Foundation
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    // print(String(arr1, radix: 2))
    for i in 0..<n {
        let binary = String(arr1[i] | arr2[i], radix: 2)  // 2진수 변환
        
        let zfill = String(repeating: "0", count: n - binary.count) + binary
        
        answer.append(String(zfill.map({ $0 == "1" ? "#" : " "})))
    }
    return answer
}

//// ["#####","# # #", "### #", "# ##", "#####"]
//print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
//
//// ["######", "### #", "## ##", " #### ", " #####", "### # "]
//print(solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10]))
