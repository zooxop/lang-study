import kotlin.math.max

fun main() {
    val solution = Solution()
    val result = solution.solution(2, 91)
    println(result)
}

class Solution {
    fun solution(a: Int, b: Int): Int {
        return max("$a$b".toInt(), 2*a*b)
    }
}