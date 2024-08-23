package programmers.level1

private fun solution(k: Int, score: IntArray): IntArray {
    var answer: IntArray = intArrayOf()
    val hall = mutableListOf<Int>()

    for (i in 0 until score.size) {
        if (hall.size < k) {
            hall.add(score[i])
            answer += hall.minOf { it }
            continue
        }

        hall.sortDescending()
        if (hall.last() > score[i]) {
            answer += hall.last()
        } else {
            hall[k-1] = score[i]
            answer += hall.minOf { it }
        }
    }

    return answer
}