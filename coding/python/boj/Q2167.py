N, M = map(int, input().split())
arr = []

for _ in range(N):
   arr.append(list(map(int, input().split())))

K = int(input())

for _ in range(K):
    i, j, x, y = map(int, input().split())
    result = 0
    for row in range(i-1, x):
        for col in range(j-1, y):
            result += arr[row][col]
    print(result)
