package algorithm.kotlin.programmers.solutions.level1

import java.util.HashMap

private fun solution(players: Array<String>, callings: Array<String>): Array<String> {
    val currentRankingMap = HashMap<String, Int>()
    val currentRankingList = players.toMutableList()

    players.forEachIndexed { index, player ->
        currentRankingMap[player] = index
    }

    callings.forEach { calledPlayer ->
        val currentPosition = currentRankingMap[calledPlayer]!!
        val playerAhead = currentRankingList[currentPosition - 1]

        currentRankingList[currentPosition] = playerAhead
        currentRankingList[currentPosition - 1] = calledPlayer

        currentRankingMap[playerAhead] = currentPosition
        currentRankingMap[calledPlayer] = currentPosition - 1
    }

    return currentRankingList.toTypedArray()
}