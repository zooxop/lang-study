package algorithm.java.boj.bronze;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class P1032_명령프롬프트 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());

        String[] files = new String[N];
        for (int i = 0; i < N; i++) {
            files[i] = br.readLine();
        }

        StringBuilder result = new StringBuilder(files[0]);

        for (int i = 0; i < files[0].length(); i++) {
            for (int j = 1; j < files.length; j++) {
                if (result.charAt(i) != files[j].charAt(i)) {
                    result.setCharAt(i, '?');
                    break;
                }
            }
        }

        System.out.println(result);
    }
}
