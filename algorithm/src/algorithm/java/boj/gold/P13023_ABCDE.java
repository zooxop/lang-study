package algorithm.java.boj.gold;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class P13023_ABCDE {
    static ArrayList<Integer>[] adj;
    static boolean[] visited;
    static int result = 0;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        adj = new ArrayList[n];
        visited = new boolean[n];

        for (int i = 0; i < n; i++) {
            adj[i] = new ArrayList<>();
        }

        for (int i = 0; i < m; i++) {
            st = new StringTokenizer(br.readLine());
            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());

            adj[a].add(b);
            adj[b].add(a);
        }

        for (int i = 0; i < n; i++) {
            if (visited[i] == false) {
                dfs(i, 1);
            }
            if (result == 1) break;
        }

        System.out.println(result);
    }

    static void dfs(int now, int depth) {
        if (result == 1 || depth == 5) {
            result = 1;
            return;
        }

        visited[now] = true;

        for (int i: adj[now]) {
            if (visited[i] == false) {
                dfs(i, depth + 1);
            }
        }

        visited[now] = false;
    }
}
