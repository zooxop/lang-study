package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;

public class P1181_단어정렬 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());

        Set<String> inputs = new HashSet<>();
        for (int i = 0; i < N; i++) {
            inputs.add(br.readLine());
        }

        inputs.stream()
            .sorted(Comparator.comparing(String::length).thenComparing(Comparator.naturalOrder()))
            .forEach(System.out::println);
    }
}
