package javajava;

import java.util.stream.IntStream;

public class Main {
    public static void main(String[] args) {
        Solution solution = new Solution();
        int result = solution.solution(10);

        System.out.println(result);
    }
}

class Solution {
    public int solution(int n) {
        return IntStream.rangeClosed(0, n)
            .filter(e -> e % 2 == 0)
            .sum();
    }
}