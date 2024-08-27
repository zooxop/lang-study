package programmers.level1

private fun solution(k: Int, m: Int, score: IntArray): Int {
    return score.asSequence()
        .sortedDescending()
        .chunked(m)
        .filter { it.size == m }
        .map { it.minOf { min -> min } * it.size }
        .sum()
}