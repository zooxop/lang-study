import sys
# dfs 함수 하나로 해결한 코드.

N = int(sys.stdin.readline())
# arr = []
arr = [[0] * N for _ in range(N)]  # N*N 행렬 생성 및 0으로 초기화.
result = []  # 결과 출력을 위한 리스트
# for _ in range(N):
#     arr.append(list(sys.stdin.readline().rstrip()))

arr[0] = [0, 0, 0, 0, 0, 0, 0, 0]
arr[1] = [0, 0, 0, 0, 0, 0, 0, 0]
arr[2] = [0, 0, 0, 0, 1, 1, 1, 1]
arr[3] = [0, 0, 0, 0, 1, 1, 1, 1]
arr[4] = [0, 0, 0, 1, 1, 1, 1, 1]
arr[5] = [0, 0, 1, 1, 1, 1, 1, 1]
arr[6] = [0, 0, 1, 1, 1, 1, 1, 1]
arr[7] = [0, 0, 1, 1, 1, 1, 1, 1]


def dfs(x, y, size):
    value = arr[x][y]

    # O(N*N)
    for i in range(x, x + size):
        for j in range(y, y + size):
            if arr[i][j] != value:
                result.append("(")
                dfs(x, y, size//2)  # 2사분면
                dfs(x, y+size//2, size//2)  # 1사분면
                dfs(x+size//2, y, size//2)  # 3사분면
                dfs(x+size//2, y+size//2, size//2)  # 4사분면
                result.append(")")
                return

    result.append(value)


dfs(0, 0, N)
print(''.join(map(str, result)))


# (0(0011)(0(0111)01)1)