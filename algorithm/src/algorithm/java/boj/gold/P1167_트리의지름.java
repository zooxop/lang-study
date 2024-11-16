package algorithm.java.boj.gold;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

public class P1167_트리의지름 {
    static ArrayList<Node>[] nodes;
    static boolean[] visited;
    static int max = 0;
    static int farthestNodeIndex;

    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);

        int v = sc.nextInt();
        nodes = new ArrayList[v + 1];
        for (int i = 1; i <= v; i++) {
            nodes[i] = new ArrayList<>();
        }

        for (int i = 1; i <= v; i++) {
            int s = sc.nextInt();

            while (true) {
                int e = sc.nextInt();
                if (e == -1) break;
                int cost = sc.nextInt();
                nodes[s].add(new Node(e, cost));
            }
        }

        visited = new boolean[v + 1];
        dfs(1, 0);

        visited = new boolean[v + 1];
        dfs(farthestNodeIndex, 0);

        System.out.println(max);
    }

    static void dfs(int index, int length) {
        if (length > max) {
            max = length;
            farthestNodeIndex = index;
        }

        visited[index] = true;

        for (int i = 0; i < nodes[index].size(); i++) {
            Node node = nodes[index].get(i);
            if (visited[node.e] == false) {
                dfs(node.e, node.cost + length);
                visited[node.e] = true;
            }
        }
    }

    static class Node {
        public int e;
        int cost;

        public Node(int e, int cost) {
            this.e = e;
            this.cost = cost;
        }
    }
}
