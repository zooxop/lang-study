import com.sun.org.apache.xalan.internal.lib.ExsltMath.power
import java.util.*
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.pow
import kotlin.math.sqrt
import kotlin.time.times

fun main() {
    val solution = Solution()
    val result = solution.solution(
        intArrayOf(3, 7, 2, 5, 4, 6, 1),
        booleanArrayOf(false, true, true, true, true, false, false)
    )
    //println(result.forEach { println(it.contentToString()) })
    //println(result.forEach { println(it) })
    println(result)
}

class Solution {
    fun solution(rank: IntArray, attendance: BooleanArray): Int {
        var answer: Int = 0
        return answer
    }
}