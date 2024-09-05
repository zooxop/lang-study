package programmers.level1

private fun solution(wallpaper: Array<String>): IntArray {
    val xArray = mutableListOf<Int>()
    val yArray = mutableListOf<Int>()

    for (i in wallpaper.indices) {
        for (j in wallpaper[i].indices) {
            if (wallpaper[i][j] == '#') {
                xArray.add(i)
                yArray.add(j)
            }
        }
    }

    xArray.sort()
    yArray.sort()

    return intArrayOf(xArray.first(), yArray.first(), xArray.last()+1, yArray.last()+1)
}