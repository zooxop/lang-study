N = int(input())
board = [list(map(int, input().split())) for _ in range(N)]

dp = [[0] * N for _ in range(N)]
dp[0][0] = 1

for i in range(N):
    for j in range(N):
        if i == j == (N-1):
            print(dp[i][j])
            break

        temp = board[i][j]

        # 아래로 점프
        if (i + temp) < N:
            dp[i+temp][j] += dp[i][j]

        # 우측으로 점프
        if (j + temp) < N:
            dp[i][j+temp] += dp[i][j]
