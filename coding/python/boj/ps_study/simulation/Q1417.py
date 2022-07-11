N = int(input())
arr = []
count = 0

for _ in range(0, N):
    arr.append(int(input()))

if N > 1:  # 단일 후보일 땐 매수할 필요가 없다.
    while True:
        _max = max(arr)
        if _max > arr[0]:
            idx = arr.index(_max)
            arr[idx] -= 1
            arr[0] += 1
            count += 1
        elif _max == arr[0] and arr.count(arr[0]) >= 2:
            count += 1
            print(count)
            break
        else:
            print(count)
            break
else:
    print(0)
