package kotlinkotlin.programmers.level1

fun solution(X: String, Y: String): String {
    val xCount = IntArray(10)
    val yCount = IntArray(10)

    X.forEach { xCount[it - '0']++ }
    Y.forEach { yCount[it - '0']++ }

    val result = StringBuilder()
    var isZero = false

    for (i in 9 downTo 0) {
        if (xCount[i] == 0 || yCount[i] == 0) { continue }

        val count = minOf(xCount[i], yCount[i])

        if (count == 0) { continue }

        if (i > 0 || isZero) {
            result.append(i.toString().repeat(count))
            isZero = true
        } else {
            result.append("0")
        }
    }

    return when {
        result.isEmpty() -> "-1"
        else -> result.toString()
    }
}

/* 시간초과
fun solution(X: String, Y: String): String {
        var answer = ""

        val xMap = mutableMapOf<Char, Int>()
        val yMap = mutableMapOf<Char, Int>()

        (0 until max(X.length, Y.length)).forEach { i ->
            if (i < X.length) {
                xMap[X[i]] = xMap.getOrDefault(X[i], 0) + 1
            }
            if (i < Y.length) {
                yMap[Y[i]] = yMap.getOrDefault(Y[i], 0) + 1
            }
        }

        ('9' downTo '0').forEach { i ->
            val minimum = min(xMap.getOrDefault(i, 0), yMap.getOrDefault(i, 0))
            repeat(minimum) {
                answer += i
            }
        }

        return when {
            answer.isEmpty() -> "-1"
            answer.all { it == '0' } -> "0"
            else -> answer
        }
    }
 */