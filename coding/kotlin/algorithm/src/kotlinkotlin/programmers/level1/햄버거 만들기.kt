package kotlinkotlin.programmers.level1

import java.util.*

private fun solution(ingredient: IntArray): Int {
    var answer: Int = 0

    val template = listOf(1, 2, 3, 1)
    val stack = Stack<Int>()

    ingredient.forEach {
        stack.push(it)

        if (stack.takeLast(4) == template) {
            repeat(4) { stack.pop() }
            answer++
        }
    }

    return answer
}