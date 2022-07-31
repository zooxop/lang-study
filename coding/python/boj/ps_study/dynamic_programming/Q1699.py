N = int(input())
dp = [x for x in range(0, 100001)]  # 인덱스와 원소값을 동일하게 셋팅. ex) dp[13] = 13

for i in range(1, N+1):
    for j in range(1, i+1):
        dp[i] = min(dp[i], dp[i - (j*j)] + 1)
        if j*j > i:
            break

print(dp[N])


"""
0일 때: 0개
1일 때: 1개 (1^2)
2일 때: 2개 (1^2 + 1^2)
3일 때: 3개 (1^2 + 1^2 + 1^2)
4일 때: 4개 또는 1개 (1^2 + 1^2 + 1^2 + 1^2) 또는 (2^2)

따라서, dp[4] = min(dp[4], dp[4 - (2^2)] + 1)
"""