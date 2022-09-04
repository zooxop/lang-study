import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result: [Int] = Array(repeating: 0, count: id_list.count)   // 각 유저가 받은 결과 메일 수
    var reportedInfo = [String: Set<String>]()                      // 유저별 신고당한 정보
    var suspendedUser = [String]()                                  // 정지된 유저 ID
    
    // 딕셔너리 만들기
    id_list.forEach { id in
        reportedInfo[id] = []
    }
    
    // 유저별 신고당한 정보 구하기
    report.map { $0.split(separator: " ") }.forEach { content in
        let reporter = String(content[0])
        let reported = String(content[1])
        reportedInfo[reported]?.insert(reporter)    // 동일 중복 신고 방지
    }
    
    // 이용 정지 유저 구하기
    for report in reportedInfo {
        if report.value.count >= k {
            suspendedUser.append(report.key)
        }
    }
//    reportedInfo.forEach { report in
//        if report.value.count >= k {
//            suspendedUser.append(report.key)
//        }
//    }
    
    // 유저별 받을 결과 메일 수 구하기
    for key in suspendedUser {
        for id in reportedInfo[key]! {
            let idx = id_list.firstIndex(of: id)
            result[idx!] += 1
        }
    }
    
//    suspendedUser.forEach { key in
//        reportedInfo[key]!.forEach { id in
//            print(id)
//            result[id_list.firstIndex(of: id)!] += 1
//        }
//    }
    
    return result
}

// [2,1,1,0]
// print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
