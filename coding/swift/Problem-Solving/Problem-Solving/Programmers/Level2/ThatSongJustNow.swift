import Foundation
func solution(_ m:String, _ musicinfos:[String]) -> String {
    var results = [(Int, String)]()  // 재생 시간, 제목
    
    for i in 0..<musicinfos.count {
        let arr = musicinfos[i].components(separatedBy: ",")
        let startTime = arr[0].components(separatedBy: ":")
        let endTime = arr[1].components(separatedBy: ":")
        
        let calcHH = Int(endTime[0])! - Int(startTime[0])!
        let calcMM = Int(endTime[1])! - Int(startTime[1])!
        
        // 재생 시간(분)
        let playMinute = (calcHH * 60) + calcMM
        
        // 악보 Array로 변환
        var scales = [String]()
        for scale in Array(arr[3]) {
            if scale == "#" {
                scales[scales.endIndex-1] += "#"
            } else {
                scales.append(scale.description)
            }
        }
        
        // 실제 재생된 음계들
        var playedScale = [String]()
        for i in 0..<playMinute {
            playedScale.append(scales[i % scales.count])
        }
        
        // 입력값 m과 재생 음계 비교
        for i in 0..<playedScale.count {
            // 아래 if 조건이 충족할 때 까지 반복했다면,
            // 모든 경우의 수를 다 탐색한 것이므로 break
            // 1. 실제 재생된 음계 배열을 전부 탐색했거나,
            // 2. 악보(arr[3]) 길이의 두배 만큼 탐색했거나.
            if playedScale.count - i == 1 || (arr[3].count * 2) == i {
                break
            }
            
            var temp = ""
            var j = i
            while temp.count < m.count {
                if j >= playedScale.count {
                    j = 0
                }
                temp += playedScale[j]
                j += 1
            }
            
            if temp == m {
                results.append((playMinute, arr[2]))
                break
            }
        }

    }
    
    // 재생시간 기준 내림차순 정렬
    results = results.sorted { r1, r2 in
        return r1.0 > r2.0
    }
    
    // 출력
    if !results.isEmpty {
        return results[0].1  // 제목
    } else {
        return "(None)"
    }
    
}

//print(solution("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
//print(solution("CC#BCC#BCC#BCC#B", ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]))
//
//// HELLO
//print(solution("ABC", ["13:00,13:05,WORLD,ABCDEF", "13:00,13:05,BEST,ABCDEF", "12:00,12:14,HELLO,CDEFGAB"]))
//
//// WORLD
//print(solution("ABC", ["13:00,13:05,WORLD,ABCDEF", "13:00,13:05,BEST,ABCDEF"]))
