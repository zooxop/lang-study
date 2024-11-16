package algorithm.java.boj.silver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class P1260_DFS와BFS {
    static ArrayList<Integer>[] adj;
    static boolean[] visited;

    static StringBuffer dfsSb = new StringBuffer();
    static StringBuffer bfsSb = new StringBuffer();

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());
        int v = Integer.parseInt(st.nextToken());

        adj = new ArrayList[n+1];
        for (int i = 1; i <= n; i++) {
            adj[i] = new ArrayList<>();
        }

        for (int i = 0; i < m; i++) {
            st = new StringTokenizer(br.readLine());
            int s = Integer.parseInt(st.nextToken());
            int e = Integer.parseInt(st.nextToken());
            adj[s].add(e);
            adj[e].add(s);
        }

        for (int i = 1; i <= n; i++) {
            Collections.sort(adj[i]);
        }

        visited = new boolean[n+1];
        dfs(v);

        visited = new boolean[n+1];
        bfs(v);

        System.out.println(dfsSb);
        System.out.println(bfsSb);
    }

    public static void dfs(int v) {
        if (visited[v]) {
            return;
        }

        visited[v] = true;
        dfsSb.append(v).append(" ");

        for (int i: adj[v]) {
            if (visited[i] == false) {
                dfs(i);
            }
        }
    }

    public static void bfs(int v) {
        Queue<Integer> queue = new LinkedList<>();
        queue.add(v);
        visited[v] = true;

        while (queue.isEmpty() == false) {
            int node = queue.poll();
            bfsSb.append(node).append(" ");

            for (int i: adj[node]) {
                if (visited[i] == false) {
                    visited[i] = true;
                    queue.add(i);
                }
            }
        }
    }
}
