package algorithm.kotlin.programmers.solutions.level1

// 잘 푼 예제
private fun solution(n: Int, m: Int, section: IntArray): Int {
    var answer = 0
    var nextSection = 0
    section.forEach {
        if (it >= nextSection) {
            answer++
            nextSection = it + m
        }
    }
    return answer
}

// 내가 푼거 (개별로)
//private fun solution(n: Int, m: Int, section: IntArray): Int {
//    val array = (1..n).map { !section.contains(it) }
//        .toMutableList()
//        .apply { addAll(List(m) { true })}
//
//    var count = 0
//
//    for (i in section) {
//        if (array[i-1]) { continue }
//
//        count++
//        repeat(m) {
//            array[it + (i-1)] = true
//        }
//    }
//
//    return count
//}