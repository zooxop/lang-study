N = int(input())

dp = [[0] * 11 for _ in range(N+1)]  # N+1 x 11 2차원 리스트 선언.
_sum = 0

for j in range(0, 10):  # 1자리 수는 1로 초기화.
    dp[1][j] = 1

for i in range(2, N+1):
    dp[i][0] = dp[i-1][1]  # '0'으로 끝나는 숫자 = i-1의 '1'로 끝나는 숫자와 경우의 수가 동일하다.
    for j in range(1, 10):
        dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000

for i in range(1, 10):
    _sum = (_sum + dp[N][i]) % 1000000000

print(_sum)

"""
10,
21, 
12, 32,
23, 43, 
34, 54, 
45, 65, 
56, 76, 
67, 87, 
78, 98,
89
"""