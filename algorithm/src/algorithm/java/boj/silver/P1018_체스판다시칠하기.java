package algorithm.java.boj.silver;

import java.io.IOException;
import java.util.Scanner;

public class P1018_체스판다시칠하기 {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);

        int row = sc.nextInt();
        int col = sc.nextInt();
        sc.nextLine();

        String[] board = new String[row];
        for (int i = 0; i < row; i++) {
            board[i] = sc.nextLine();
        }

        int answer = Integer.MAX_VALUE;
        for (int i = 0; i <= row - 8; i++) {
            for (int j = 0; j <= col - 8; j++) {
                int value = getCount(i, j, board);
                if (value < answer) answer = value;
            }
        }

        System.out.println(answer);
    }

    private static int getCount(int startRow, int startCol, String[] board) {
        String[] template = {"WBWBWBWB", "BWBWBWBW"};
        int count = 0;
        for (int i = 0; i < 8; i++) {
            int row = startRow + i;
            for (int j = 0; j < 8; j++) {
                int col = startCol + j;
                if (board[row].charAt(col) != template[row % 2].charAt(j)) {
                    count++;
                }
            }
        }

        return Math.min(64 - count, count);
    }
}
