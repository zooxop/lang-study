package algorithm.java.boj.silver;

import java.io.IOException;
import java.util.Scanner;

public class P1094_막대기 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);

        System.out.println(Integer.toBinaryString(sc.nextInt())
            .chars()
            .mapToObj(c -> (char) c)
            .filter(c -> c == '1').count()
        );
    }
}
