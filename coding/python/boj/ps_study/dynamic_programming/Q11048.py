N, M = map(int, input().split())
arr = [[0] * (M+1) for _ in range(N+1)]
dp = [[0] * (M+1) for _ in range(N+1)]

for i in range(1, N+1):
    temp = list(map(int, input().split()))
    for j in range(1, M+1):
        arr[i][j] = temp[j-1]

for i in range(1, N+1):
    for j in range(1, M+1):
        dp[i][j] = max((arr[i][j] + dp[i][j-1]), (arr[i][j] + dp[i-1][j]))

print(dp[N][M])


"""
점화식 : dp[i][j] = max((arr[i][j] + dp[i][j-1]), (arr[i][j] + dp[i-1][j]))
- arr[i][j] + dp[i-1][j-1] 계산값은 고려할 필요 없다.
  - 최대값을 구하는 문제이므로, 최단경로는 최대값을 보장할 수 없기 때문.
  
입력 ex)
3 4
1 2 3 4
0 0 0 5
9 8 7 6

일 때, 정답은 [31] 이고 입력 arr과 dp의 상태는 다음과 같음.

arr[][]
| 0| 0| 0| 0| 0|
| 0| 1| 2| 3| 4|
| 0| 0| 0| 0| 5|
| 0| 9| 8| 7| 6|

dp[][]
| 0| 0| 0| 0| 0|
| 0| 1| 3| 6|10|
| 0| 1| 3| 6|15|
| 0|10|18|25|31|
"""