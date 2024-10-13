package kotlinkotlin.programmers.level1

// 내 풀이
//private fun solution(survey: Array<String>, choices: IntArray): String {
//    var answer: String = ""
//    val template: Array<String> = arrayOf("R", "T", "C", "F", "J", "M", "A", "N")
//    val scores: Array<Int> = Array(8) { 0 }
//
//    choices.forEachIndexed { index, choice ->
//        val type = when (survey[index]) {
//            "TR" -> 0
//            "RT" -> 1
//            "FC" -> 2
//            "CF" -> 3
//            "MJ" -> 4
//            "JM" -> 5
//            "NA" -> 6
//            "AN" -> 7
//            else -> 99999
//        }
//
//        scores[type] += (choice - 4)
//    }
//
//    (0..7 step 2).forEach {
//        answer += when {
//            scores[it] > scores[it + 1] -> template[it]
//            scores[it] < scores[it + 1] -> template[it + 1]
//            else -> arrayOf(template[it], template[it + 1]).minOf { type -> type }
//        }
//    }
//
//    return answer
//}

// 코틀린 영역 함수 적극 활용한 풀이
fun solution(survey: Array<String>, choices: IntArray): String {
    val orders = listOf("RT", "CF", "JM", "AN")
    return choices
        .mapIndexed { index, i ->
            if (i-4 < 0) {
                survey[index][0] to -(i-4)
            } else {
                survey[index][1] to (i-4)
            }
        }
        .groupBy { it.first }
        .map { it.key to it.value.sumOf { v:Pair<Char, Int> -> v.second } }
        .toMap()
        .let { ans:Map<Char, Int> ->
            orders.map {
                if (ans.getOrDefault(it[0], 0) >= ans.getOrDefault(it[1], 0)) it[0] else it[1]
            }
        }
        .joinToString("")
}
// mapIndexed : [(N, 1), (C, 1), (M, 2), (T, 3), (A, 1)]
// groupBy : {N=[(N, 1)], C=[(C, 1)], M=[(M, 2)], T=[(T, 3)], A=[(A, 1)]}
// map : [(N, 1), (C, 1), (M, 2), (T, 3), (A, 1)]
// toMap : {N=1, C=1, M=2, T=3, A=1}