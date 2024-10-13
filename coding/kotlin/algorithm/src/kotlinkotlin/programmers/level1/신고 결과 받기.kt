package kotlinkotlin.programmers.level1

import java.util.HashMap

private fun solution(id_list: Array<String>, report: Array<String>, k: Int): IntArray {
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