package programmers.level1

private fun solution(N: Int, stages: IntArray): IntArray {
    var denominator = stages.size

    return (1..N).asSequence().map {
        if (denominator <= 0) {
            0.toDouble()
        } else {
            val count = stages.count { stage -> stage == it }
            val rate = count.toDouble() / denominator.toDouble()
            denominator -= count
            rate
        }
    }.withIndex()
        .map { (i, v) -> i+1 to v }
        .sortedByDescending { it.second }
        .map { it.first }
        .toList()
        .toIntArray()
}