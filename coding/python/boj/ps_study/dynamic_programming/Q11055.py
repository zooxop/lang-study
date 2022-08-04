import copy

N = int(input())
A = list(map(int, input().split()))
dp = copy.deepcopy(A)

for i in range(1, N):
    for j in range(0, i):
        if A[i] > A[j] and dp[i] < dp[j]+A[i]:
            dp[i] = dp[j] + A[i]

print(max(dp))
