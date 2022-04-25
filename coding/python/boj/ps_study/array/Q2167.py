N, M = map(int, input().split())
arr = []

for _ in range(N):
   arr.append(list(map(int, input().split())))

K = int(input())
dp = [[0] * (M+1) for _ in range(N+1)]  # dynamic 2차원 배열 선언

# 동적 계획법
# 총 합을 미리 계산해놓은 배열을 새로 만든다.
# 일반 구현 방식에 비해, 메모리 사용량이 증가하지만 동작 속도는 빠르다.
for i in range(1, N+1):
    for j in range(1, M+1):
        dp[i][j] = arr[i-1][j-1] + dp[i][j-1] + dp[i-1][j] - dp[i-1][j-1]

for _ in range(K):
    i, j, x, y = map(int, input().split())
    print(dp[x][y] - dp[x][j-1] - dp[i-1][y] + dp[i-1][j-1])




"""
2 3
1 2 3
4 5 6


3 4
0 0 0 0
0 1 3 6
0 4 5 6

"""