package archive

// 최대공약수(GCD) / 최소공배수(LCM)
class GcdAndLcm {
    private fun gcd(a: Int, b: Int): Int {
        var x = a
        var y = b
        while (y != 0) {
            val temp = y
            y = x % y
            x = temp
        }
        return x
    }

    private fun lcm(a: Int, b: Int): Int {
        return a / gcd(a, b) * b
    }
}