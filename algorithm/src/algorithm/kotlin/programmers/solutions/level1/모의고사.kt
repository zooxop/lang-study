package algorithm.kotlin.programmers.solutions.level1

private fun solution(answers: IntArray): IntArray {
    val p1 = arrayOf(1, 2, 3, 4, 5)
    val p2 = arrayOf(2, 1, 2, 3, 2, 4, 2, 5)
    val p3 = arrayOf(3, 3, 1, 1, 2, 2, 4, 4, 5, 5)

    val counts = IntArray(3)

    answers.forEachIndexed { i, v ->
        if (p1[i % p1.size] == v) counts[0]++
        if (p2[i % p2.size] == v) counts[1]++
        if (p3[i % p3.size] == v) counts[2]++
    }

    val maxValue = counts.max()
    return counts.withIndex()
        .filter { it.value == maxValue }
        .map { it.index + 1 }
        .toIntArray()
}