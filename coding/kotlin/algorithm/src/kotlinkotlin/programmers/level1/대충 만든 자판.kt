package kotlinkotlin.programmers.level1

// 내 풀이
//private fun solution(keymap: Array<String>, targets: Array<String>): IntArray {
//    val map = mutableMapOf<Char, Int>()
//    keymap.forEach { key ->
//        key.forEachIndexed { i, c ->
//            if (map.getOrDefault(c, 101) > i) {
//                map[c] = i + 1
//            }
//        }
//    }
//
//    return targets.map { target ->
//        var count = 0
//
//        for (i in 0 until target.length) {
//            val len = map.getOrDefault(target[i], 0)
//
//            if (len == 0) {
//                count = 0
//                break
//            }
//            count += len
//        }
//
//        if (count == 0) -1 else count
//    }.toIntArray()
//}

// (변수 재할당 없이) 영역함수 등으로만 해결한 풀이
private fun solution(keymap: Array<String>, targets: Array<String>) = keymap
    .flatMap { it.mapIndexed { idx, char -> char to (idx + 1) } }
    .groupBy { it.first }
    .map { it.key to it.value.minOf { v -> v.second } }
    .toMap()
    .let { map -> targets.map { it.sumOf { char -> map[char] ?: 10001 } } }
    .map { if (it >= 10001) -1 else it }
    .toIntArray()