package algorithm.java.boj.bronze;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class P2566_최댓값 {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int[][] board = new int[9][9];
        int max = Integer.MIN_VALUE;
        int x = 0;
        int y = 0;

        for (int i = 0; i < 9; i++) {
            Integer[] line = Arrays.stream(br.readLine().split(" "))
                .map(Integer::parseInt)
                .toArray(Integer[]::new);

            for (int j = 0; j < 9; j++) {
                if (line[j] > max) {
                    max = line[j];
                    x = i+1;
                    y = j+1;
                }
            }
        }

        System.out.println(max);
        System.out.println(x + " " + y);
    }
}
