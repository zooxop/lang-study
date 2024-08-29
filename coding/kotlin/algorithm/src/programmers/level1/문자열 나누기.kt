package programmers.level1

// 내 풀이 (개구림)
//private fun solution(s: String): Int {
//    val target = s + s
//    var countSame = 0
//    var countNotSame = 0
//
//    var totalCount = 0
//    var x = s[0]
//
//    for (i in 0 until s.length) {
//        if (target[i] == x) countSame++
//        else countNotSame++
//
//        if (countSame == countNotSame) {
//            totalCount++
//            countSame = 0
//            countNotSame = 0
//            x = target[i+1]
//        }
//    }
//
//    return if (countSame == 0 && countNotSame == 0) totalCount else totalCount + 1
//}

// 잘 푼 풀이 (Stack 개념 이용)
fun solution(s: String): Int {
    var answer: Int = 0

    val stack = mutableListOf<Char>()

    s.forEach {
        if (stack.isEmpty()) {
            answer++
            stack.add(it)
        } else if (stack.first() == it) {
            stack.add(it)
        } else {
            stack.removeFirst()
        }
    }

    return answer
}