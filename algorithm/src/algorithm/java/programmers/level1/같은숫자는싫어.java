package algorithm.java.programmers.level1;

import java.util.stream.IntStream;

public class 같은숫자는싫어 {
    public int[] solution(int []arr) {
        return IntStream.range(0, arr.length)
            .filter(i -> i == 0 || arr[i] != arr[i-1])
            .map(i -> arr[i])
            .toArray();
    }
}
