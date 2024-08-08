package archive

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
}