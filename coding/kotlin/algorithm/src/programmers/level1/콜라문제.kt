package programmers.level1

private fun solution(a: Int, b: Int, n: Int): Int {
    var current: Int = n
    var rest = 0
    var total = 0

    while (current > 0) {
        if (current % a != 0) {
            rest = current % a
        }

        total += (current / a) * b
        current = ((current / a) * b) + rest

        rest = 0

        if (current < a) { break }
    }

    return total
}