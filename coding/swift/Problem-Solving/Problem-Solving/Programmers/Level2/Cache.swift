import Foundation
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache = [String]()
    var result = 0
    
    for city in cities {
        let temp = city.lowercased()
        if cache.contains(temp) {
            cache.remove(at: cache.firstIndex(of: temp)!)
            cache.append(temp)
            result += 1
            
        } else {
            if cache.count < cacheSize {
                cache.append(temp)
            } else if cacheSize > 0 {
                cache.append(temp)
                cache.removeFirst()
            }
            result += 5
        }
    }
    
    return result
}

//// 50
//print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
//// 21
//print(solution(3, ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]))
//// 60
//print(solution(2, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))
//// 52
//print(solution(5, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))
//
//// 16
//print(solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"]))
