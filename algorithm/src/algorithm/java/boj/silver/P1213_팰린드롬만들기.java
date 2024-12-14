package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class P1213_팰린드롬만들기 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String input = br.readLine();

        Map<String, Integer> dict = new HashMap<>();
        for (int i = 0; i < input.length(); i++) {
            dict.put(input.substring(i, i+1), dict.getOrDefault(input.substring(i, i+1), 0) + 1);
        }

        int oddCount = 0;
        String centralChar = "";
        StringBuilder palindrome = new StringBuilder();

        for (Map.Entry<String, Integer> entry : dict.entrySet()) {
            if (entry.getValue() % 2 != 0) {
                oddCount++;
                centralChar = entry.getKey();
            }
            if (oddCount >= 2) {
                System.out.println("I'm Sorry Hansoo");
                break;
            }

            palindrome.append(
                String.valueOf(entry.getKey())
                    .repeat(Math.max(0, entry.getValue() / 2))
            );
        }

        if (oddCount < 2) {
            StringBuilder result = new StringBuilder();

            char[] sorted = palindrome.toString().toCharArray();
            Arrays.sort(sorted);

            result.append(sorted);
            result.append(centralChar);

            for (int i = sorted.length - 1; i >= 0; i--) {
                result.append(sorted[i]);
            }
            System.out.println(result);
        }
    }
}
