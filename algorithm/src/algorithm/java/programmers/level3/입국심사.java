package algorithm.java.programmers.level3;

import java.util.Arrays;

public class 입국심사 {
    public long solution(int n, int[] times) {
        Arrays.sort(times);
        long start = times[0];
        long end = (long) Arrays.stream(times).max().orElseThrow() * n;

        while (start <= end) {
            long mid = (start + end) / 2;
            long checkedCount = 0;

            for (int time : times) {
                checkedCount += mid / time;
            }

            if (checkedCount < n) {
                start = mid + 1;
            } else {
                end = mid - 1;
            }
        }

        return start;
    }
}
