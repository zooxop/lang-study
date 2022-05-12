from collections import deque

N, K = map(int, input().split())
visited = [0 for _ in range(100001)]

if N - K >= 0:
    print(N - K)
else:
    que = deque()
    que.append(N)

    # TC: O(N+E)  N: Node의 개수, E: 확장된 노드의 개수
    while que:
        temp = que.popleft()

        if temp == K:
            print(visited[temp])
            break

        # TC: O(1) (최소 1, 최대 3)
        for i in (temp-1, temp+1, temp*2):
            if 0 <= i <= 100000 and not visited[i]:
                que.append(i)
                visited[i] = visited[temp]+1


""" pseudo code
1. 최단 경로를 구하는 문제는 BFS로 풀이한다.
2. BFS에 필요한 요소
    - 방문 기록 리스트
    - 방문 예정 큐
3. 방문 기록 리스트에 현재 탐색까지 걸린 시간을 기록한다.
    - 이는 그래프의 깊이를 의미함.

구현
N, K = input  (N: 시작점, K: 목표지점)
visited = list(길이: 100001, 0으로 초기화)
que = deque() (popleft()를 사용해야 하므로, deque 사용)

if N-K >= 0 then
    print(N-K)  # N이 더 큰 경우에는 N-1마다 1초씩 증가하므로.
else then
    # BFS를 진행한다.
    queue = [N]  # root node
    
    while queue.empty do
        temp = queue.pop
        
        if temp == K then
            print (visited[temp])
            break
        
        if temp+1, temp-1, temp*2 값들 중 아직 방문한 적이 없는값 then
            index = 방문한 적이 없는 값
            visited[index] = visited[temp] + 1  # 1초를 추가한 값을 방문 리스트에 할당하면서 "방문기록" 과 "시간"을 동시에 기록.
            queue.append(index)  # 방문 대기열에 등록
            
    end while 
"""