package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class P1316_그룹단어체커 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());

        String[] inputs = new String[N];
        for (int i = 0; i < N; i++) {
            inputs[i] = br.readLine();
        }

        int count = 0;

        for (int i = 0; i < N; i++) {
            count++;
            StringBuilder saved = new StringBuilder(inputs[i].substring(0, 1));

            for (int j = 1; j < inputs[i].length(); j++) {
                String prev = inputs[i].substring(j - 1, j);
                String current = String.valueOf(inputs[i].charAt(j));

                if (saved.toString().contains(current) && !prev.equals(current)) {
                    count--;
                    break;
                }
                saved.append(current);
            }
        }

        System.out.println(count);
    }
}
