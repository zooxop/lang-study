import sys
sys.setrecursionlimit(10**6)


def dfs(x, y, height):
    global N
    global visited

    if x < 0 or x >= N or y < 0 or y >= N:
        return

    if visited[x][y] == 1:
        return

    visited[x][y] = 1  # 방문 처리

    if arr[x][y] > height:
        dfs(x, y+1, height)  # 동
        dfs(x, y-1, height)  # 서
        dfs(x+1, y, height)  # 남
        dfs(x-1, y, height)  # 북


N = int(input())
arr = []

visited = [[0] * N for _ in range(N)]  # dynamic 2차원 배열 선언
count = 0
max_height = 0

for i in range(0, N):
    arr.append(list(map(int, input().split())))
    if max_height < max(arr[i]):
        max_height = max(arr[i])

for h in range(max_height):
    temp_count = 0
    for i in range(N):
        for j in range(N):
            if visited[i][j] == 0 and arr[i][j] > h:  # 아직 방문하지 않았다면
                dfs(i, j, h)
                temp_count += 1

    visited = [[0] * N for _ in range(N)]
    if temp_count > count:
        count = temp_count

print(count)
