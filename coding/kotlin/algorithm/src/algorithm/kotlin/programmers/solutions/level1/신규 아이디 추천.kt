package algorithm.kotlin.programmers.solutions.level1

private fun solution(new_id: String): String {
    val answer = new_id
        .map {
            it.lowercase()
        }
        .filter {
            it.single().isLowerCase() || it.single().isDigit() || it in listOf("-", "_", ".")
        }
        .joinToString("")
        .replace(Regex("\\.{2,}"), ".")
        .ifBlank { "a" }
        .let {
            if (it.isNotEmpty() && it.first() == '.') it.drop(1) else it
        }
        .let {
            if (it.isNotEmpty() && it.last() == '.') it.dropLast(1) else it
        }
        .ifBlank { "a" }
        .filterIndexed { i, _ -> i < 15 }
        .let {
            when (it.length) {
                1 -> { it + it.last() + it.last() }
                2 -> { it + it.last() }
                else -> { it }
            }
        }
        .let {
            if (it.isNotEmpty() && it.last() == '.') it.dropLast(1) else it
        }

    return answer
}