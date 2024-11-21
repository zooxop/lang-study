package algorithm.java.boj.silver;

import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

public class P1931_회의실배정 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);

        int N = sc.nextInt();
        int[][] meetings = new int[N][2];
        for (int i = 0; i < N; i++) {
            meetings[i][0] = sc.nextInt();
            meetings[i][1] = sc.nextInt();
        }

        Arrays.sort(meetings, new Comparator<int[]>() {
            @Override
            public int compare(int[] o1, int[] o2) {
                if (o1[1] == o2[1]) {  // 종료 시간이 같을 때
                    return o1[0] - o2[0];
                }
                return o1[1] - o2[1];
            }
        });

        int count = 0;
        int temp = 0;
        for (int i = 0; i < N; i++) {
            if (meetings[i][0] >= temp) {
                count++;
                temp = meetings[i][1];
            }
        }

        System.out.println(count);
    }
}
