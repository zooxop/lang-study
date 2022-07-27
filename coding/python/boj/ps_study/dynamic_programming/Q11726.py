import sys
sys.setrecursionlimit(10**6)


def tile(n):
    if n == 0:
        return 0
    if n == 1:
        return 1
    if n == 2:
        return 2

    if dp[n] != 0:
        return dp[n]

    dp[n] = tile(n-1) + tile(n-2)
    return dp[n]


N = int(input())
dp = [0] * 1001

print(tile(N) % 10007)
