package kotlinkotlin.archive

// 원소의 총 개수와 동일한 길이의 순열을 뽑아내는 함수.
// e.g.) ["a", "b", "c"] => [abc, acb, bac, bca, cab, cba]
class Permutation {
    private fun getPermutations(elements: List<String>): List<String> {
        if (elements.size == 1) {
            return elements
        }

        val permutations = mutableListOf<String>()

        for (i in elements.indices) {
            val currentElement = elements[i]
            val remainingElements = elements.filterIndexed { index, _ -> index != i }
            val subPermutations = getPermutations(remainingElements)

            for (subPermutation in subPermutations) {
                permutations.add("$currentElement$subPermutation")
            }
        }

        return permutations
    }
}