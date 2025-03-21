package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class P1929_소수구하기 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int M = Integer.parseInt(st.nextToken());
        int N = Integer.parseInt(st.nextToken());

        boolean[] isNotPrimes = new boolean[N + 1];

        // 에라토스테네스의 체
        for (int i = 2; i <= Math.sqrt(N); i++) {
            if (isNotPrimes[i]) {
                continue;
            }
            for (int j = i + i; j <= N; j = j + i) {
                isNotPrimes[j] = true;
            }
        }

        for (int i = M; i <= N; i++) {
            if (i < 2) continue;
            if (isNotPrimes[i] == false) System.out.println(i);
        }
    }
}
