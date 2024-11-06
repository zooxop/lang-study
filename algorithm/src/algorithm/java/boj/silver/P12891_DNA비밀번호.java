package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

public class P12891_DNA비밀번호 {
    static String[] dna = new String[] {"A", "C", "G", "T"};
    static Map<String, Integer> checkMap = new HashMap<>();
    static Map<String, Integer> tempMap = new HashMap<>();

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int S = Integer.parseInt(st.nextToken());  // 9
        int P = Integer.parseInt(st.nextToken());  // 8
        char[] template = br.readLine().toCharArray();  // CCTGGATTG

        st = new StringTokenizer(br.readLine());
        for (String s : dna) {
            checkMap.put(s, Integer.parseInt(st.nextToken()));  // 2 0 1 1
            tempMap.put(s, 0);
        }

        // 맨 첫번째 윈도우 초기화
        for (int i = 0; i < P; i++) {
            String key = Character.toString(template[i]);
            if (Arrays.asList(dna).contains(key)) {
                tempMap.put(key, tempMap.get(key) + 1);
            }
        }

        int result = checkEnable(0);

        // sliding window
        for (int i = P; i < S; i++) {
            // add
            String endKey = Character.toString(template[i]);
            tempMap.put(endKey, tempMap.get(endKey) + 1);

            // remove
            String startKey = Character.toString(template[i - P]);
            tempMap.put(startKey, tempMap.get(startKey) - 1);

            result = checkEnable(result);
        }

        System.out.println(result);
    }

    private static int checkEnable(int result) {
        if ((tempMap.get(dna[0]) >= checkMap.get(dna[0])) &&
            (tempMap.get(dna[1]) >= checkMap.get(dna[1])) &&
            (tempMap.get(dna[2]) >= checkMap.get(dna[2])) &&
            (tempMap.get(dna[3]) >= checkMap.get(dna[3]))) {
            return ++result;
        }

        return result;
    }
}
