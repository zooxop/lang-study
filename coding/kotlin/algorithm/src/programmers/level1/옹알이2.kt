package programmers.level1

private fun solution(babbling: Array<String>): Int {
    val sources = arrayOf("aya", "ye", "woo", "ma")

    return babbling.filter {
        var temp = it
        for (source in sources) {
            if (temp.contains(source.repeat(2))) { continue }
            temp = temp.replace(source, " ")
        }

        temp.replace(" ", "").isEmpty()
    }.size
}