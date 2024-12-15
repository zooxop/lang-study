package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class P1193_분수찾기 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int X = Integer.parseInt(br.readLine());

        int cross_count = 1;
        int prev_count_sum = 0;

        while (X > prev_count_sum + cross_count) {
            prev_count_sum += cross_count;
            cross_count++;
        }

        if (cross_count % 2 == 0) {
            System.out.println((X - prev_count_sum) + "/" + (cross_count - (X - prev_count_sum - 1)));
        } else {
            System.out.println((cross_count - (X - prev_count_sum - 1)) + "/" + (X - prev_count_sum));
        }
    }
}
