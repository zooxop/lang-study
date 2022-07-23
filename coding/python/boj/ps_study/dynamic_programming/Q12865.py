# Top-down / 배낭 문제
def knapsack(i, k):
    if i < 0:
        return 0

    if not dp[i][k]:  # 탐색하지 않은 위치라면
        if W[i] > k:  # 현재 물건을 추가로 담지 못하는 경우 => 이전 i값 탐색
            dp[i][k] = knapsack(i-1, k)
        else:  # 현재 물건(i)을 담을 수 있는 경우
            # 이전 i값과, 이전 i값에 대한 k-W[i]의 값 + 현재 가치(V[i]) 중 큰 값을 저장.
            dp[i][k] = max(knapsack(i-1, k), knapsack(i-1, k-W[i]) + V[i])

    return dp[i][k]


N, K = map(int, input().split())
dp = [[None] * (K+1) for _ in range(N)]
W = []  # 무게
V = []  # 가치

for _ in range(N):
    _w, _v = map(int, input().split())
    W.append(_w)
    V.append(_v)

print(knapsack(N-1, K))
