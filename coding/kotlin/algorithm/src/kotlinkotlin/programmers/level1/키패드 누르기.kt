package kotlinkotlin.programmers.level1

import kotlin.math.abs

private fun solution(numbers: IntArray, hand: String): String {
    var answer = ""
    var currentLeft = 3
    var currentRight = 3
    var isCenterLeft = false
    var isCenterRight = false

    numbers.forEach { number ->
        when (number) {
            1, 4, 7 -> {
                currentLeft = number / 3
                answer += "L"
                isCenterLeft = false
            }
            3, 6, 9 -> {
                currentRight = number / 4
                answer += "R"
                isCenterRight = false
            }
            2, 5, 8, 0 -> {
                val index = when (number) {
                    2 -> 0
                    5 -> 1
                    8 -> 2
                    0 -> 3
                    else -> -1
                }
                val distanceLeft = abs(index - currentLeft).let { if (isCenterLeft) it else it+1 }
                val distanceRight = abs(index - currentRight).let { if (isCenterRight) it else it+1 }

                if (distanceLeft < distanceRight) {
                    currentLeft = index
                    answer += "L"
                    isCenterLeft = true
                } else if (distanceLeft > distanceRight) {
                    currentRight = index
                    answer += "R"
                    isCenterRight = true
                } else {
                    if (hand == "left") {
                        currentLeft = index
                        answer += "L"
                        isCenterLeft = true
                    } else {
                        currentRight = index
                        answer += "R"
                        isCenterRight = true
                    }
                }
            }
        }
    }

    return answer
}