package kotlinkotlin.programmers.level1

private fun solution(today: String, terms: Array<String>, privacies: Array<String>): IntArray {
    val splitToday = today.split(".").map(String::toInt)

    val termsMap = terms.associate {
        val (key, value) = it.split(" ")
        key to value.toInt()
    }

    return privacies.map {
        val temp = it.split(" ")
        val sep = temp[0].split(".").map(String::toInt)

        var year = sep[0]
        var month = sep[1] + termsMap[temp[1]]!!.toInt()

        if (month > 12) {
            year += (month / 12)
            month %= 12
        }

        if (month <= 0) {
            month = 12
            year -= 1
        }

        var date = 0
        if (sep[2] == 1) {
            month -= 1
            if (month <= 0) {
                year -= 1
                month = 12
            }
            date = 28
        } else {
            date = sep[2] - 1
        }

        if (splitToday[0] > year) {
            true
        } else if (splitToday[0] == year) {
            if (splitToday[1] > month) {
                true
            } else if (splitToday[1] == month) {
                if (splitToday[2] > date) {
                    true
                } else {
                    false
                }
            } else {
                false
            }
        } else {
            false
        }
    }.withIndex().filter {
        it.value
    }.map {
        it.index + 1
    }.toIntArray()
}