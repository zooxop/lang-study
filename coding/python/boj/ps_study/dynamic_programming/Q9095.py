dp = [0] * 12
dp[1] = 1
dp[2] = 2
dp[3] = 4


def solution(n):
    if n < 4 or dp[n] != 0:
        return dp[n]
    else:
        solution(n-1)

    dp[n] = dp[n-1] + dp[n-2] + dp[n-3]
    return dp[n]


if __name__ == "__main__":
    N = int(input())

    for _ in range(0, N):
        print(solution(int(input())))


"""
1 = 1
2 = 2
3 = 4
4 = 7

dp[N] = dp[N-1] + dp[N-2] + dp[N-3] 
"""