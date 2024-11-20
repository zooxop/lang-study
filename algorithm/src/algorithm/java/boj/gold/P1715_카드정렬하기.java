package algorithm.java.boj.gold;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.PriorityQueue;

public class P1715_카드정렬하기 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());
        PriorityQueue<Integer> cards = new PriorityQueue<>();
        for (int i = 0; i < N; i++) {
            cards.add(Integer.parseInt(br.readLine()));
        }

        int count = 0;
        while (cards.size() > 1) {
            int data1 = cards.remove();
            int data2 = cards.remove();
            count += (data1 + data2);

            cards.add(data1 + data2);
        }

        System.out.println(count);
    }
}
