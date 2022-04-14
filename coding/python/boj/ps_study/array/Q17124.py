idxCheck = lambda arr, idx: max(min(len(arr) - 1, idx), 0)
# def idxCheck(arr, idx):  # 위 람다식을 풀어서 쓴 코드
#     length = len(arr)-1
#     minVal = min(length, idx)
#     rsltVal = max(minVal, 0)
#     return rsltVal


def closer(a1, a2, target):  # a1과 a2중 target 과 더 가까운 값을 리턴.
    if a1 is None:
        return a2
    if a2 is None:
        return a1
    return a1 if abs(a1 - target) <= abs(a2 - target) else a2


def binSearch(arr, target):
    length = len(arr)
    left = 0
    right = length - 1

    while left <= right:
        mid = (left + right) // 2
        if arr[mid] > target:
            right = mid - 1
        elif arr[mid] < target:
            left = mid + 1
        else:
            return mid

    # 현재까지 탐색한 index: mid
    # arr[mid] 보다 arr[mid+1] 값과 더 가까운 경우를 확인 후 return.
    # (mid < length-1) => index out of range 방지
    if (mid < length-1) and (abs(target - arr[mid+1]) < abs(target - arr[mid])):
        return mid+1
    else:
        return mid


T = int(input())

for _ in range(T):
    n, m = map(int, input().split())
    A = list(map(int, input().split()))
    B = list(map(int, input().split()))
    B.sort()
    C = []

    for a in A:
        idx = binSearch(B, a)
        ans = closer(B[idxCheck(B, idx - 1)], B[idxCheck(B, idx)], a)
        C.append(ans)

    print(sum(C))


# input sample:
# 3
# 4 3
# 20 5 14 9
# 16 8 12
# 3 4
# 16 8 12
# 20 5 14 9
# 3 3
# 1 2 3
# 2 3 4