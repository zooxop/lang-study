package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.Queue;
import java.util.StringTokenizer;

public class P2178_미로탐색 {
    static int[][] maze;
    static boolean[][] visited;
    static int n, m;
    // 상하좌우 순서
    static final int[] dx = {-1, 1, 0, 0};
    static final int[] dy = {0, 0, -1, 1};

    static int depth = 0;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        n = Integer.parseInt(st.nextToken());
        m = Integer.parseInt(st.nextToken());

        maze = new int[n][m];
        visited = new boolean[n][m];
        for (int i = 0; i < n; i++) {
            st = new StringTokenizer(br.readLine());
            String line = st.nextToken();
            for (int j = 0; j < m; j++) {
                maze[i][j] = Integer.parseInt(line.substring(j, j+1));
            }
        }

        bfs(0, 0);
        System.out.println(maze[n-1][m-1]);
    }

    static void bfs(int startX, int startY) {
        Queue<int[]> queue = new LinkedList<>();
        queue.add(new int[] {startX, startY});
        visited[startX][startY] = true;

        while (queue.isEmpty() == false) {
            int[] temp = queue.poll();

            if (temp[0] == n && temp[1] == m) break;

            for (int i = 0; i < 4; i++) {
                int x = temp[0] + dx[i];
                int y = temp[1] + dy[i];

                if (x < 0 || x >= n || y < 0 || y >= m) {
                    continue;
                }

                if (maze[x][y] != 0 && !visited[x][y]) {
                    visited[x][y] = true;
                    maze[x][y] = maze[temp[0]][temp[1]] + 1;
                    queue.add(new int[] {x, y});
                }
            }
        }
    }
}
