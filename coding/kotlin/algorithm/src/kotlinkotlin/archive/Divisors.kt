package kotlinkotlin.archive

import kotlin.math.sqrt

// 약수 구하기
class Divisors {
    private fun getDivisors(N: Int): List<Int> {
        val divisors = mutableListOf<Int>()
        for (i in 1..sqrt(N.toDouble()).toInt()) {
            if (N % i == 0) {
                divisors.add(i)
                if (i != N / i) {
                    divisors.add(N / i)
                }
            }
        }
        return divisors
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
}