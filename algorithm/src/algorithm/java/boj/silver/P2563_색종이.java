package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class P2563_색종이 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());
        int sum = 0;
        boolean[][] white = new boolean[100][100];

        for (int i = 0; i < N; i++) {
            String[] black = br.readLine().split(" ");
            int x = Integer.parseInt(black[0]);
            int y = Integer.parseInt(black[1]);

            for (int a = x; a < x + 10; a++) {
                for (int b = y; b < y + 10; b++) {
                    if (!white[a][b]) {
                        white[a][b] = true;
                        sum += 1;
                    }
                }
            }
        }

        System.out.println(sum);
    }
}
