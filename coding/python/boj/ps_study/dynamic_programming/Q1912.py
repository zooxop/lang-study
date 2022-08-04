N = int(input())
seq = list(map(int, input().split()))
dp = [0] * N
dp[0] = seq[0]

for i in range(1, N):
    dp[i] = max(seq[i], dp[i-1] + seq[i])

print(max(dp))


"""
5
-4 4 -3 3 6
10
"""