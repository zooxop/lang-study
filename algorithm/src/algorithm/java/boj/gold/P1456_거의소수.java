package algorithm.java.boj.gold;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class P1456_거의소수 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        long A = Long.parseLong(st.nextToken());
        long B = Long.parseLong(st.nextToken());

        int[] primes = new int[10000001];
        for (int i = 2; i < primes.length; i++) {
            primes[i] = i;
        }

        for (int i = 2; i <= Math.sqrt(primes.length); i++) {
            if (primes[i] == 0) continue;

            for (int j = (i + i); j < primes.length; j += i) {
                primes[j] = 0;
            }
        }

        int count = 0;
        for (int i = 2; i < 10000001; i++) {
            if (primes[i] == 0) continue;

            long temp = primes[i];
            while ((double) primes[i] <= (double) B / (double) temp) {
                if ((double) primes[i] >= (double) A / (double) temp) count++;

                temp = temp * primes[i];
            }
        }

        System.out.println(count);
    }
}
