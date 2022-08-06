N = int(input())
dp = [0] * (N+1)

dp[0], dp[1] = 1, 3

for i in range(2, N+1):
    dp[i] = ((dp[i-1]*2) + dp[i-2]) % 9901

print(dp[N])


"""
0 = 1
1 = 3
2 = 7
3 = 17
4 = 41
"""