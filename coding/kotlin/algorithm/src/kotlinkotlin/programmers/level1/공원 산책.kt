package kotlinkotlin.programmers.level1

private fun solution(park: Array<String>, routes: Array<String>): IntArray {
    var xy = intArrayOf(0, 0)
    for (i in park.indices) {
        val row = park[i]
        val j = row.indexOf('S')
        if (j != -1) {
            xy = intArrayOf(i, j)
        }
    }

    routes.forEach {
        val route = it.split(" ")
        val n = route[1].toInt()

        when (route[0]) {
            "N" -> xy = move(park, xy, intArrayOf(-1, 0), n)
            "E" -> xy = move(park, xy, intArrayOf(0, 1), n)
            "W" -> xy = move(park, xy, intArrayOf(0, -1), n)
            "S" -> xy = move(park, xy, intArrayOf(1, 0), n)
        }
    }

    return xy
}

private fun move(park: Array<String>, xy: IntArray, operation: IntArray, n: Int): IntArray {
    val temp = xy.copyOf()

    for (i in 0 until n) {
        val targetX = temp[0] + operation[0]
        val targetY = temp[1] + operation[1]

        if (targetY < 0 || targetY >= park[0].length ||
            targetX < 0 || targetX >= park.size) {
            return xy
        }

        if (park[targetX][targetY] == 'X') {
            return xy
        }

        temp[0] = targetX
        temp[1] = targetY
    }

    return temp
}