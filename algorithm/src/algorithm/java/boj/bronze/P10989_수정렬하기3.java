package algorithm.java.boj.bronze;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class P10989_수정렬하기3 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());
        int[] arr = new int[10_001];
        for (int i = 0; i < N; i++) {
            arr[Integer.parseInt(br.readLine())]++;
        }

        br.close();

        StringBuilder sb = new StringBuilder();
        for (int i = 1; i <= 10_000; i++) {
            while (arr[i] > 0) {
                sb.append(i).append('\n');
                arr[i]--;
            }
        }
        System.out.println(sb);
    }
}
