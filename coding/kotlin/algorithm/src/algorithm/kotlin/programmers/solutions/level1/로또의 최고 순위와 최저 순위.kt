package algorithm.kotlin.programmers.solutions.level1

private fun solution(lottos: IntArray, win_nums: IntArray): IntArray {
    return lottos.filter { it == 0 || win_nums.contains(it) }
        .let { matched ->
            intArrayOf(
                (7 - matched.size).coerceAtMost(6),
                (7 - matched.count { it != 0 }).coerceAtMost(6)
            )
        }
}