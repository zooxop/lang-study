arr = list(map(int, input().split()))
for i in range(0, len(arr)):
    arr[i] *= arr[i]

print(sum(arr) % 10)
