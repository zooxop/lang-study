package algorithm.kotlin.programmers.solutions.level1

import kotlin.math.sqrt

private fun solution(number: Int, limit: Int, power: Int): Int {
    return (1..number).sumOf { index ->
        getDivisorsCount(index).let { count ->
            if (count <= limit) count
            else power
        }
    }
}

private fun getDivisorsCount(n: Int): Int {
    if (n == 1) return 1
    if (n == 2 || n == 3) return 2

    var count = 0
    val x = sqrt(n.toDouble()).toInt()

    for (i in 1..x) {
        if (i * i == n) count++
        else if (n % i == 0) count += 2
    }

    return count
}