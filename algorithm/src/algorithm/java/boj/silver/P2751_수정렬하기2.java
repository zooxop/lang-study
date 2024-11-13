package algorithm.java.boj.silver;

import java.io.*;
import java.util.StringTokenizer;

public class P2751_수정렬하기2 {

    // Counting sort 버전
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(br.readLine());

        boolean[] array = new boolean[2_000_001];
        for (int i = 0; i < N; i++) {
            array[Integer.parseInt(br.readLine()) + 1_000_000] = true;
        }

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < array.length; i++) {
            if (array[i]) {
                sb.append(i - 1_000_000).append("\n");
            }
        }

        System.out.println(sb);
    }
}


class P2715_병합정렬버전 {
    public static int[] numbers;
    public static int[] temp;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringTokenizer st;

        int N = Integer.parseInt(br.readLine());
        numbers = new int[N];
        temp = new int[N];
        for (int i = 0; i < N; i++) {
            st = new StringTokenizer(br.readLine());
            numbers[i] = Integer.parseInt(st.nextToken());
        }

        mergeSort(numbers, 0, N - 1);

        for (int number : numbers) {
            bw.write(number + "\n");
        }
        bw.flush();
    }

    public static void mergeSort(int[] number, int left, int right) {
        int mid;
        if (left < right) {
            mid = (left + right) / 2;
            mergeSort(number, left, mid);
            mergeSort(number, mid + 1, right);
            merge(number, left, right);
        }
    }

    public static void merge(int[] number, int left, int right) {
        int mid = (left + right) / 2;
        int p = left;
        int q = mid + 1;
        int k = left;

        while (p <= mid || q <= right) {
            if (p <= mid && q <= right) {
                if (number[p] > number[q]) {
                    temp[k++] = number[q++];
                } else {
                    temp[k++] = number[p++];
                }
            } else if (p <= mid) {
                temp[k++] = number[p++];
            } else {
                temp[k++] = number[q++];
            }
        }

        for (int i = left; i < right + 1; i++) {
            number[i] = temp[i];
        }
    }

}