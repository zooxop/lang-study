from collections import deque


# TC: O(N*M)
def dfs(number, visited=[]):  # number : Node의 번호
    visited.append(number)
    print(number, end=" ")

    for d in range(len(graph[number])):  # branch의 넓이만큼 반복.
        if graph[number][d] == 1 and d not in visited:  # 간선이 있으면서, 아직 방문하지 않은 정점인 경우
            dfs(d, visited)  # 재귀


# TC: O(N*M)
def bfs(number):
    visited = [number]  # 방문 기록 리스트. 최초 방문한 노드를 할당하면서 초기화.
    que = deque()
    que.append(number)  # bfs 구현을 위한 queue

    while que:
        temp = que.popleft()
        print(temp, end=" ")

        for b in range(len(graph[temp])):  # branch의 넓이만큼 반복.
            if graph[temp][b] == 1 and b not in visited:  # 간선이 있으면서, 아직 방문하지 않은 정점인 경우
                visited.append(b)  # 방문처리
                que.append(b)  # 탐색 대기 처리


# main 프로그램 시작
N, M, V = map(int, input().split())
graph = [[0] * (N + 1) for _ in range(N + 1)]  # N*N 2차원배열 생성

# 인접행렬 할당  TC: O(M)
for _ in range(M):
    i, j = map(int, input().split())
    graph[i][j] = 1
    graph[j][i] = 1

dfs(V)
print()
bfs(V)

""" pseudo code
N, M, V 입력
for 0 to M do
  i, j 입력
  graph[i][j], graph[j][i] 에 1 할당.
endfor

func dfs()
begin
  1. 재귀함수로 구성.
  2. 방문한 노드를 기록해놓을 리스트가 필요함.
  3. 새로운 노드 방문 시, print
end

func bfs()
begin
  1. Deque를 이용하여 구현.
    - 파이썬은 Queue가 따로 없고, 리스트를 사용해야 함.
    - 리스트의 pop(0)은 시간복잡도가 O(N)임.
    - Deque의 popleft()는 시간복잡도가 O(1)임.
  2. 방문한 노드를 기록해놓을 리스트가 필요함.
  3. 새로운 노드 방문 시, print
  4. 앞으로 방문해야 할 노드를 Deque에 쌓아나가면서 BFS 알고리즘을 진행.
end

main 프로그램 begin
  dfs(V) 호출.
  bfs(V) 호출.
"""

# 5 5 1
# 1 2
# 1 3
# 2 4
# 4 3
# 4 5
# dfs : 1 2 4 3 5
# bfs : 1 2 3 4 5


# 5 5 3
# 5 4
# 5 2
# 1 2
# 3 4
# 3 1
# dfs : 3 1 2 5 4
# bfs : 3 1 4 2 5

"""
1 => 2, 3    DFS :  1 => C, 3     BFS :  1 => D, 3
2 => 1, 5           2 => 1, D            2 => 1, 5
3 => 1, 4           A => B, 4            A => B, C
4 => 3, 5           4 => 3, 5            4 => 3, E
5 => 2, 4           5 => 2, E            5 => 2, 4
"""
