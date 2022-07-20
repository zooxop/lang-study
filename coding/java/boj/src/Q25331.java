import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

/**
 * 시간 복잡도: O(n^10)
 */

public class Q25331 {
    private static int[][] tempGrid;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        //1. 격자 공간 선언(가로 그룹 탐색 시 마지막 공이 0보다 크면 탐색이 안 되는 문제로 여유 공간 추가)
        int[][] grid = new int[7][8];
        tempGrid = new int[7][8];
        int MIN = Integer.MAX_VALUE;

        for (int i = 0; i < 7; i++) {
            st = new StringTokenizer(br.readLine());
            for (int j = 0; j < 7; j++) grid[i][j] = Integer.parseInt(st.nextToken());
        }

        st = new StringTokenizer(br.readLine());
        int ball = Integer.parseInt(st.nextToken());

        //2. 각 세로 라인에 공을 떨어뜨리며 남은 공의 최솟값 탐색
        for (int i = 0; i < 7; i++) {
            //2.1. 최솟값이 0이면 종료
            if (MIN == 0) break;

            //2.2. 임시 배열 복사
            for (int x = 0; x < 7; x++) {
                System.arraycopy(grid[x], 0, tempGrid[x], 0, 7);
            }

            //2.3. 현재 라인의 첫 번째 0이 아닌 곳의 이전 위치나 제일 끝에 공을 위치시킨다.
            for (int j = 0; j < 7; j++) {
                if (tempGrid[j][i] > 0 || j == 6) {
                    int l;

                    if (tempGrid[j][i] > 0) l = j - 1;
                    else l = j;

                    tempGrid[l][i] = ball;

                    //2.4. 격자를 탐색하여 대상이 되는 공을 제거한다.
                    removeBall();

                    //2.5. 제거 후 남은 공의 갯수를 구한다.
                    int remain = 0;
                    for (int x = 0; x < 7; x++) {
                        for (int y = 0; y < 7; y++) {
                            if (tempGrid[x][y] > 0) remain++;
                        }
                    }

                    //2.6. 최솟값 구하기
                    MIN = Math.min(MIN, remain);

                    break;
                }
            }
        }
        System.out.println(MIN);
    }

    private static void removeBall() {
        int count;
        boolean isRemoved = false;
        //2.4.1. 가로 그룹과 세로 그룹이 동시에 제거되므로 우선 표시만 하기 위해 사용
        boolean[][] removed = new boolean[7][7];

        //2.4.2. 세로 그룹 탐색(세로 그룹은 무조건 공들이 붙어있다)
        for (int i = 0; i < 7; i++) {
            count = 0;
            //2.4.2.1. 그룹에 속한 공의 갯수
            for (int j = 0; j < 7; j++) {
                if (tempGrid[j][i] > 0) count++;
            }
            //2.4.2.2. 공의 갯수와 같은 값을 가진 공 표시
            if (count > 0) {
                for (int j = 0; j < 7; j++) {
                    if (tempGrid[j][i] == count) {
                        removed[j][i] = true;
                        isRemoved = true;
                    }
                }
            }
        }

        //2.4.3. 가로 그룹 탐색(가로 그룹은 공들이 떨어져 있을 수 있다)
        for (int i = 0; i < 7; i++) {
            count = 0;
            int l = 0;
            for (int j = 0; j < 8; j++) {
                //2.4.3.1. 공이 있으면 갯수 증가
                if (tempGrid[i][j] > 0) {
                    //2.4.3.1.1. 처음으로 공을 만난 위치 표시
                    if (count == 0) l = j;
                    count++;
                } else {
                    if (count > 0) {
                        //2.4.3.2. 처음으로 공을 만난 위치부터 현재 위치까지 검사
                        for (int k = l; k < j; k++) {
                            //2.4.3.2.1. 그룹에 속한 공의 갯수와 같은 값을 가진 공 표시
                            if (tempGrid[i][k] == count) {
                                removed[i][k] = true;
                                isRemoved = true;
                            }
                        }
                    }
                    count = 0;
                }
            }
        }

        //2.4.4. 표시된 공 제거
        for (int i = 0; i < 7; i++) {
            for (int j = 0; j < 7; j++) {
                if (removed[i][j]) tempGrid[i][j] = 0;
            }
        }

        //2.4.5. 아래에 빈 공간이 존재하면 공들을 아래로 이동
        downBall();

        //2.4.6. 제거된 공이 하나라도 있으면 재귀
        if (isRemoved) removeBall();
    }

    private static void downBall() {
        for (int j = 0; j < 7; j++) {
            for (int k = 0; k < 7; k++) {
                for (int i = 1; i < 7; i++) {
                    if (tempGrid[i][j] == 0 && tempGrid[i - 1][j] > 0) {
                        tempGrid[i][j] = tempGrid[i - 1][j];
                        tempGrid[i - 1][j] = 0;
                    }
                }
            }
        }
    }
}