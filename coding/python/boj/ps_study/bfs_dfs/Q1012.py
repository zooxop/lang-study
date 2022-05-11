import sys
sys.setrecursionlimit(10 ** 6)  # (10 ** 6) == 10^6, 파이썬으로 재귀 문제를 풀 때 필수임.
input = sys.stdin.readline
T = int(input())  # 테스트 케이스 개수


def dfs(x, y):
    if x < 0 or x >= M or y < 0 or y >= N:
        return

    if farm[x][y] == 0:  # 이미 탐색한 배추
        return

    farm[x][y] = 0  # 탐색한 배추는 0으로 갱신

    dfs(x+1, y)  # 남
    dfs(x, y+1)  # 동
    dfs(x-1, y)  # 북
    dfs(x, y-1)  # 서


# TC: O(T)
for _ in range(T):
    M, N, K = map(int, input().split())
    farm = [[0] * N for _ in range(M)]  # dynamic 2차원 배열 선언
    count = 0  # 지렁쓰 마릿수

    # TC: O(K)
    for _ in range(K):  # 배추 위치 입력
        i, j = map(int, input().split())
        farm[i][j] = 1

    # dfs   TC: O(N^2) (재귀, 인접행렬)
    for i in range(M):
        for j in range(N):
            if farm[i][j] == 1:
                dfs(i, j)  # 인접 배추 탐색
                count += 1  # dfs 종료 => 지렁이++

    print(count)


""" pseudo code
1. M*N 2차원 배열(행렬) 선언 및 0으로 초기화
2. 입력받은 배추 위치 i,j로 고랭지[i][j] = 1 할당
3. 배열 전체를 탐색
    3.1 값이 1일때(배추가 있을 때) dfs 함수를 통해 i,j의 동서남북을 체크.

dfs(): (재귀)
    if 넘겨받은 좌표 x,y에 배추가 있다면 then
        좌표 x,y에 방문표시.
    else if 배추가 없다면 then
        return
        
    dfs(동)
    dfs(서)
    dfs(남)
    dfs(북)
    

"""