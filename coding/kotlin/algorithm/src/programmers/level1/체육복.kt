package programmers.level1

private fun solution(n: Int, lost: IntArray, reserve: IntArray): Int {
    val lostList = lost.filter { it !in reserve }.sorted()
    val reserveList = reserve.filter { it !in lost }.sorted().toMutableList()
    var count = 0

    for (i in lostList.indices) {
        if (lostList[i]-1 in reserveList) {
            count++
            reserveList.remove(lostList[i]-1)
            continue
        }

        if (lostList[i]+1 in reserveList) {
            count++
            reserveList.remove(lostList[i]+1)
        }
    }

    return n - lostList.size + count
}