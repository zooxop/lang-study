package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class P2343_기타레슨 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        int[] lectures = new int[n];
        int start = 0;
        int end = 0;
        st = new StringTokenizer(br.readLine());
        for (int i = 0; i < n; i++) {
            lectures[i] = Integer.parseInt(st.nextToken());
            if (lectures[i] > start) start = lectures[i];
            end += lectures[i];
        }

        while (start <= end) {
            int median = (start + end) / 2;
            // median 값으로 모든 레슨을 담을 수 있는지 확인
            int sum = 0;
            int count = 0;
            for (int i = 0; i < n; i++) {
                if (sum + lectures[i] > median) {
                    count++;
                    sum = 0;
                }
                sum += lectures[i];
            }

            // 탐색 후 sum이 0이 아니면 블루레이가 1개 더 필요하므로 +1
            if (sum != 0) count++;

            if (count > m) {
                start = median + 1;
            } else {
                end = median - 1;
            }
        }

        System.out.println(start);
    }
}
