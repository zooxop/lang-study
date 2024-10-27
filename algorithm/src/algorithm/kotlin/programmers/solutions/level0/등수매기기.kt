package algorithm.kotlin.programmers.solutions.level0

// 다른 사람 풀이
/*
    // 평균으로 정렬 후 현재값의 인덱스를 찾아서 +1 => 자연스럽게 현재값보다 앞에 있는 숫자(큰 숫자)의 개수만큼 인덱스가 밀리는 원리를 활용
    fun solution(score: Array<IntArray>): IntArray {
        return score.map(IntArray::average).map { score.map(IntArray::average).sortedDescending().indexOf(it) + 1 }.toIntArray()
    }

    // 평균으로 정렬 후 현재값보다 큰 값의 개수를 매번 카운트
    fun solution(score: Array<IntArray>): IntArray {
        val scoreList = score.map { it.average() }
        return scoreList.map { curScore ->
            scoreList.count { it > curScore } + 1
        }.toIntArray()
    }
 */

// 내 풀이 (worst)
/*
    fun solution(score: Array<IntArray>): IntArray {
        val answer = mutableListOf<MutableList<Int>>()
        var rank = 0

        val sortedByScore = score.mapIndexed { i, v ->
            v + i  // 원래 위치
        }.sortedByDescending {
            it[0] + it[1]  // 점수 기준 정렬
        }

        for (i in sortedByScore.indices) {
            val newRow = sortedByScore[i].toMutableList()

            if (rank == 0) {
                rank++
                newRow.add(rank)
                answer.add(newRow)
                continue
            }

            if ((sortedByScore[i][0] + sortedByScore[i][1]) != (sortedByScore[i-1][0] + sortedByScore[i-1][1])) {
                rank += (i - rank + 1)
            }
            newRow.add(rank)
            answer.add(newRow)
        }

        return answer.sortedBy { it[2] }.map { it[3] }.toIntArray()
    }
 */