package algorithm.java.boj.gold;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class P2023_신기한소수 {
    static int n;
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        n = Integer.parseInt(br.readLine());

        // 2, 3, 5, 7 로 시작하는 수만 체크하면 된다.
        // 자리수를 늘려가며 dfs 탐색
        dfs(2, 1);
        dfs(3, 1);
        dfs(5, 1);
        dfs(7, 1);
    }

    static void dfs(int num, int digit) {
        if (digit == n) {
            System.out.println(num);
            return;
        }

        for (int i = 1; i <= 9; i++) {
            int nextNum = num * 10 + i;
            if (isPrime(nextNum)) {
                dfs(nextNum, digit + 1);
            }
        }
    }

    static boolean isPrime(int n) {
        if (n < 2) return false;
        if (n == 2) return true;
        if (n % 2 == 0) return false;

        for (int i = 3; i <= Math.sqrt(n); i += 2) {
            if (n % i == 0) return false;
        }
        return true;
    }
}
