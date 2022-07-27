# n = int(input())
# a, b = 0, 1
# for i in range(n):
#     a, b = b, a+b
# print(a)


def fibo(num):
    if num < 0:
        return 0

    if dp[num] != 0:
        return dp[num]

    dp[num] = fibo(num-1) + fibo(num-2)
    return dp[num]


N = int(input())
dp = [0] * 46
dp[1] = 1

print(fibo(N))
