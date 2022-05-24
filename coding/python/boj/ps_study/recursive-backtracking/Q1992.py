import sys

N = int(sys.stdin.readline())
arr = []
result = []  # 결과 출력을 위한 리스트
for _ in range(N):
    arr.append(list(sys.stdin.readline().rstrip()))


def dfs(x, y, size):
    if isPossible(x, y, size):
        result.append(arr[x][y])  # 분할을 할 필요가 없다면, 기준값을 출력한다.
        return  # 재귀 종료

    # 분할이 가능할 때마다 "(" 로 연다.
    result.append("(")

    dfs(x, y, size//2)  # 2사분면
    dfs(x, y+size//2, size//2)  # 1사분면
    dfs(x+size//2, y, size//2)  # 3사분면
    dfs(x+size//2, y+size//2, size//2)  # 4사분면

    # 모든 트리의 탐색이 끝나면 ")"로 닫는다.
    result.append(")")


# 분할이 가능하다면 False return
def isPossible(x, y, size):
    value = arr[x][y]

    # TC: O(N*N)
    for i in range(x, x+size):
        for j in range(y, y+size):
            if arr[i][j] != value:
                return False

    return True


dfs(0, 0, N)
print(''.join(map(str, result)))
