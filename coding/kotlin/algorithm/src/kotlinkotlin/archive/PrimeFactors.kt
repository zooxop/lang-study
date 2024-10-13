package kotlinkotlin.archive

// 소인수분해
class PrimeFactors {
    private fun getFactorization(n: Int): List<Int> {
        var num = n
        val factors = mutableListOf<Int>()
        var i = 2
        while (num > 1) {
            if (num % i == 0) {
                factors.add(i)
                num /= i
            } else {
                i++
            }
        }
        return factors
    }
}