package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class P1427_소트인사이드 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String N = br.readLine();
        Integer[] array = new Integer[N.length()];
        for (int i = 0; i < N.length(); i++) {
            array[i] = Integer.parseInt(N.substring(i, i+1));
        }

        for (int i = 0; i < N.length(); i++) {
            int maxIndex = i;

            for (int j = i; j < N.length(); j++) {
                if (array[j] > array[maxIndex]) {
                    maxIndex = j;
                }
            }

            if (maxIndex != i) {
                int temp = array[i];
                array[i] = array[maxIndex];
                array[maxIndex] = temp;
            }
        }

        for (Integer value : array) {
            System.out.print(value);
        }
    }
}
