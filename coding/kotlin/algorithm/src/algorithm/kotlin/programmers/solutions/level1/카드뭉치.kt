package algorithm.kotlin.programmers.solutions.level1

import java.util.ArrayDeque

private fun solution(cards1: Array<String>, cards2: Array<String>, goal: Array<String>): String {
    val deque1 = ArrayDeque(cards1.toList())
    val deque2 = ArrayDeque(cards2.toList())

    goal.forEach {
        when {
            deque1.isNotEmpty() && it == deque1.first() -> deque1.removeFirst()
            deque2.isNotEmpty() && it == deque2.first() -> deque2.removeFirst()
            else -> return "No"
        }
    }

    return "Yes"
}