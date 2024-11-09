package algorithm.java.boj.gold;

import java.io.*;
import java.util.Stack;
import java.util.StringTokenizer;

public class P17298_오큰수 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());
        int[] A = new int[N];

        StringTokenizer st = new StringTokenizer(br.readLine());
        for (int i = 0; i < N; i++) {
            A[i] = Integer.parseInt(st.nextToken());
        }

        Stack<Integer> stack = new Stack<>();
        int[] results = new int[N];

        for (int i = 0; i < N; i++) {
            while (!stack.isEmpty() && A[stack.peek()] < A[i]) {
                results[stack.peek()] = A[i];
                stack.pop();
            }

            stack.push(i);
        }

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        for (int result : results) {
            bw.write((result == 0 ? -1 : result) + " ");
        }
        bw.flush();
    }
}
