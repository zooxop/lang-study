package kotlinkotlin

import java.util.*

fun main() {
    val solution = Solution()
    val result = solution.solution(
        arrayOf("muzi", "frodo", "apeach", "neo"),
        arrayOf("muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"),
        2
    )
//    println(result.forEach { println(it.contentToString()) })
//    println(result.forEach { println(it) })
    println(result.contentToString())
    println(result)
}

class Solution {
    fun solution(id_list: Array<String>, report: Array<String>, k: Int): IntArray {
        val answer = IntArray(id_list.size) { 0 }

        val indexedIdMap = id_list.zip(id_list.indices).toMap()
        val reportedMap = HashMap<String, MutableSet<String>>()

        report.forEach {
            val ids = it.split(" ")
            reportedMap.getOrPut(ids[1]) { mutableSetOf() }.add(ids[0])
        }

        reportedMap.filter {
            it.value.size >= k
        }.forEach { reported ->
            reported.value.forEach {
                answer[indexedIdMap[it]!!]++
            }
        }

        return answer
    }
}