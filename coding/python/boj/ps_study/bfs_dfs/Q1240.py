import sys
from collections import deque

# input을 여러번 반복해야 할 때는 sys.stdin.readline() 을 사용하는것이 유리하다.
N, M = map(int, sys.stdin.readline().split())

graph = [[] for _ in range(N + 1)]  # 인접 리스트로 구현하기 위한 2차원 배열

# 인접 리스트 할당  # TC: O(N-1)
for _ in range(N-1):
    i, j, dist = map(int, sys.stdin.readline().split())
    graph[i].append([j, dist])
    graph[j].append([i, dist])
    # [target, distance] 쌍으로 쌓인다.

# TC: O(M)
for _ in range(M):
    start, target = map(int, sys.stdin.readline().split())

    visited = [0 for _ in range(N + 1)]
    que = deque()
    que.append(start)

    # TC: O(N + E)  N: 노드의 개수, E: 간선의 개수. 문제에서는 항상 N-1
    while que:
        temp = que.popleft()
        if temp == target:
            print(visited[temp])
            break

        for i in graph[temp]:  # [목표노드, 거리] 로 구성되어 있는 2칸짜리 배열을 i로 가져옴.
            if visited[i[0]] <= 0:  # 방문 여부 체크
                visited[i[0]] = visited[temp] + i[1]
                que.append(i[0])


""" pseudo code
1. 인접 리스트를 기반으로 한 BFS를 통해 문제를 해결한다.
2. 인접 리스트 graph 에는 [목표 노드, 거리]를 쌍으로 하는 배열을 할당한다.
3. visited 리스트에 현재 탐색까지의 거리를 누적시키면서 진행해나간다.

구현
N, M input (N: 노드의 개수, M: 테스트 횟수)

for 0 to N-1 do:  # 인접 리스트 구성하기
    i, j, distance = input
    graph[i].append([j, distance])
    graph[j].append([i, distance])  # 인덱스 i, j에 각각 할당해준다.
endfor
    
for _ to M do
    BFS() 구현
        queue = deque 선언
        visited = [] (길이 N으로 초기화)
        
        while queue:
            if 목표 노드를 찾았다면 then
                print(현재까지의 거리 누적값)
                break
            
            for graph[현재 탐색중인 깊이의 index] do
                if 아직 방문하지 않은 노드 then
                    visited 방문 처리 및 현재 index에 누적합 계산하여 할당 
                    queue pop()
            endfor
    
endfor 
"""

