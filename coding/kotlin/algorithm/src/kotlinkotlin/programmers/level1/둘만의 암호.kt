package kotlinkotlin.programmers.level1

private fun solution(s: String, skip: String, index: Int): String {
    val array = ('a'..'z').filter { it !in skip }

    return s.map {
        array[(array.indexOf(it) + index) % array.size]
    }.joinToString("")
}