package algorithm.java.boj.gold;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class P10986_나머지합 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int N = Integer.parseInt(st.nextToken());
        int M = Integer.parseInt(st.nextToken());
        long result = 0;
        long[] S = new long[N + 1];  // 합 배열
        long[] count = new long[M];  // 각 나머지값 별 개수 저장

        st = new StringTokenizer(br.readLine());

        for (int i = 1; i <= N; i++) {
            // 누적합을 M으로 나눈 나머지를 배열 S에 저장
            S[i] = (S[i - 1] + Long.parseLong(st.nextToken())) % M;

            // `S[i] == 0` : 0~i 까지의 합을 M으로 나눈 나머지가 0인 경우
            if (S[i] == 0) result++;

            // 나머지가 같은 인덱스의 수 카운팅
            count[(int) S[i]]++;
        }

        // nCr 연산 (경우의 수)
        for (int i = 0; i < M; i++) {
            if (count[i] > 1) {
                result += (count[i] * (count[i] - 1) / 2);
            }
        }

        System.out.println(result);
    }
}
