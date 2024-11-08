package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class P1874_스택수열 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(br.readLine());
        int[] array = new int[n];
        for (int i = 0; i < n; i++) {
            array[i] = Integer.parseInt(br.readLine());
        }

        Stack<Integer> stack = new Stack<>();
        List<String> results = new ArrayList<>();
        int current = 0;

        for (int i = 1; i <= n; i++) {
            if (i <= array[current]) {
                stack.push(i);
                results.add("+");
            }

            if (stack.isEmpty()) continue;

            while (stack.peek() >= array[current]) {
                stack.pop();
                results.add("-");
                current++;
                if (stack.isEmpty()) break;
            }
        }

        if (stack.isEmpty()) {
            for (String result : results) {
                System.out.println(result);
            }
        } else {
            System.out.println("NO");
        }
    }
}
