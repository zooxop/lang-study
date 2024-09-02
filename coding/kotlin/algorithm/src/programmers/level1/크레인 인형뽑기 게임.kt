package programmers.level1

import java.util.*

private fun solution(board: Array<IntArray>, moves: IntArray): Int {
    var answer = 0

    val intersected: Array<Stack<Int>> = Array(board[0].size) { Stack<Int>() }
    val bucket: Stack<Int> = Stack<Int>()

    for (i in board.size-1 downTo 0) {
        for (j in board[i].size-1 downTo 0) {
            if (board[i][j] == 0) continue

            intersected[j].push(board[i][j])
        }
    }

    moves.forEach {
        if (intersected[it-1].isNotEmpty()) {
            if (bucket.isNotEmpty() && bucket.last() == intersected[it-1].last()) {
                answer += 2
                intersected[it-1].pop()
                bucket.pop()
            } else {
                bucket.push(intersected[it-1].pop())
            }
        }
    }

    return answer
}