package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class P11004_K번째수_퀵소트직접구현 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int N = Integer.parseInt(st.nextToken());
        int K = Integer.parseInt(st.nextToken());
        int[] array = new int[N];

        st = new StringTokenizer(br.readLine());
        for (int i = 0; i < N; i++) {
            array[i] = Integer.parseInt(st.nextToken());
        }

        quickSort(array, 0, N-1, K-1);

        System.out.println(array[K-1]);
    }

    public static void quickSort(int[] A, int start, int end, int K) {
        if (start < end) {
            int pivot = partition(A, start, end);

            // K번째 수가 pivot 이면 더이상 구할 필요가 없음
            if (pivot == K) {
                return;
            }

            // K가 pivot보다 작으면 왼쪽 그룹만 정렬 수행하기
            if (K < pivot) {
                quickSort(A, start, pivot - 1, K);
                return;
            }

            // K가 pivot보다 크면 오른쪽 그룹만 정렬 수행하기
            quickSort(A, pivot + 1, end, K);
        }
    }

    public static int partition(int[] A, int start, int end) {
        if (start + 1 == end) {  // 만약 파티션할 부분 배열의 길이가 2라면,
            if (A[start] > A[end]) swap(A, start, end);  // 정렬 필요시 원소 교환
            return end;  // pivot 위치 반환
        }

        int mid = (start + end) / 2;  // pivot 위치값 구하기

        // pivot 위치를 맨 앞으로 옮김. 이유는 오름차순 정렬이라, pivot을 오른쪽으로만 이동시키면서 K값이 될때까지
        // 진행할것이기 때문에 맨 앞에 짱박아놓는게 아래 코드 짜기 편함.
        swap(A, start, mid);

        // 파티셔닝 로직
        int pivot = A[start];
        int i = start + 1;
        int j = end;
        while (i <= j) {
            while (j >= start + 1 && pivot < A[j]) {  // 피벗보다 작은 수가 나올 때까지 j--
                j--;
            }

            while (i <= end && pivot > A[i]) {  // 피벗보다 큰 수가 나올 때까지 i++
                i++;
            }

            // i와 j가 만나는 지점이 왔다 => pivot 과 파티션 부분 배열이 만나는 지점이다
            // => pivot 위치와, i와 j가 만난 위치를 swap 한다 => pivot 기준 왼쪽은 정렬이 끝났다는 의미
            if (i <= j) {
                swap(A, i++, j--);
            }
        }

        // 피벗 데이터를 나눠진 두 그룹의 경계 index에 저장하기
        A[start] = A[j];
        A[j] = pivot;
        return j;  // 최종적인 pivot 위치
    }

    public static void swap(int[] A, int i, int j) {
        int temp = A[i];
        A[i] = A[j];
        A[j] = temp;
    }
}
