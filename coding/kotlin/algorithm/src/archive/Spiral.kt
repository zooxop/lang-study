package archive

// n*n 크기의 2차원 배열을 나선형으로 순회하는 방법
class Spiral {
    fun solution(n: Int): Array<IntArray> {
        val answer: Array<IntArray> = Array(n) { IntArray(n) }

        val directions = arrayOf(
            intArrayOf(0, 1),  // 오른쪽
            intArrayOf(1, 0),  // 아래
            intArrayOf(0, -1), // 왼쪽
            intArrayOf(-1, 0)  // 위
        )

        var row = 0
        var col = 0
        var dir = 0

        for (i in 1 until (n * n)+1) {
            answer[row][col] = i

            val nextRow = row + directions[dir][0]
            val nextCol = col + directions[dir][1]

            if (nextRow < 0 || nextRow >= n || nextCol < 0 || nextCol >= n || answer[nextRow][nextCol] != 0) {
                dir = (dir + 1) % 4
            }

            row += directions[dir][0]
            col += directions[dir][1]
        }

        return answer
    }
}