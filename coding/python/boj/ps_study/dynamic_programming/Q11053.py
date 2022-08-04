N = int(input())
A = list(map(int, input().split()))
dp = [1] * N

for i in range(N):
    for j in range(i):
        # j번째 원소가 i번째 원소보다 작으면서 i번째 dp가 j번째 dp+1 값보다 작은 경우
        if A[j] < A[i] and dp[i] < dp[j] + 1:
            dp[i] = dp[j] + 1

print(max(dp))
