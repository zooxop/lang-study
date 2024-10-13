package kotlinkotlin.programmers.level1

private fun solution(name: Array<String>, yearning: IntArray, photo: Array<Array<String>>): IntArray {
    val yearningMap = mutableMapOf<String, Int>()
    name.forEachIndexed { i, v ->  yearningMap[v] = yearning[i] }

    return photo.map { array ->
        array.sumOf {
            yearningMap.getOrDefault(it, 0)
        }
    }.toIntArray()
}