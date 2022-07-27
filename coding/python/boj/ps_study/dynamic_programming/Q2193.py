import sys
sys.setrecursionlimit(10**6)


def func(n):
    if n == 0 or n == 1:
        return n

    if dp[n] != 0:
        return dp[n]

    dp[n] = func(n-1) + func(n-2)
    return dp[n]


N = int(input())
dp = [0] * 91
print(func(N))
