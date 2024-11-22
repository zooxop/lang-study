package algorithm.java.boj.silver;

import java.io.IOException;
import java.util.Arrays;
import java.util.Scanner;

public class P1541_잃어버린괄호 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        String input = sc.next();

        String[] split = input.split("-");

        int sum = 0;
        for (int i = 0; i < split.length; i++) {
            int temp = Arrays.stream(split[i].split("\\+"))
                .mapToInt(Integer::parseInt)
                .sum();

            if (i == 0) sum += temp;
            else sum -= temp;
        }
        System.out.println(sum);
    }
}
