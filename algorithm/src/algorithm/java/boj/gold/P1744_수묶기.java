package algorithm.java.boj.gold;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Collections;
import java.util.PriorityQueue;

public class P1744_수묶기 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());

        // 수열의 집합을 4개로 나눈다.
        // 1보다 큰수, 1, 0, 음수
        PriorityQueue<Integer> positives = new PriorityQueue<>(Collections.reverseOrder());
        int ones = 0;
        int zeros = 0;
        PriorityQueue<Integer> negatives = new PriorityQueue<>();

        for (int i = 0; i < N; i++) {
            int input = Integer.parseInt(br.readLine());
            if (input == 1) {
                ones++;
            } else if (input > 0) {
                positives.add(input);
            } else if (input == 0) {
                zeros++;
            } else {
                negatives.add(input);
            }
        }

        int maxCaseValue = 0;

        while (!positives.isEmpty()) {
            if (positives.size() == 1) {
                maxCaseValue += positives.remove();
                break;
            }

            maxCaseValue += (positives.remove() * positives.remove());
        }

        while (!negatives.isEmpty()) {
            if (negatives.size() == 1) {
                if (zeros > 0) {
                    negatives.remove();
                    zeros--;
                    break;
                }

                maxCaseValue += negatives.remove();
                break;
            }

            maxCaseValue += (negatives.remove() * negatives.remove());
        }

        System.out.println(maxCaseValue + ones);
    }
}
