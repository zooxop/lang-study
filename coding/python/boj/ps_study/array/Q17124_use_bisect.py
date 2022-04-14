import bisect  # 이분탐색


def closer(a1, a2, b):
    if a1 is None:
        return a2
    if a2 is None:
        return a1
    return a1 if abs(a1 - b) <= abs(a2 - b) else a2


def binary_search(A, B):
    # index out of range 방지를 위해, 배열의 길이를 벗어나는 값을 대입하면 0 혹은 최대 index를 반환.
    clip = lambda idx: max(min(len(B) - 1, idx), 0)
    C = []
    for a in A:
        # bisect : 이분 탐색 function. B = 정렬된 배열, a = target value
        # 값을 못찾은 경우, 가장 가까운 값 중 최소값의 idx+1 을 리턴한다.
        idx = bisect.bisect(B, a)
        C.append(closer(B[clip(idx - 1)], B[clip(idx)], a))
    return C


T = int(input())

for _ in range(T):
    n, m = map(int, input().split())
    A = list(map(int, input().split()))
    B = list(map(int, input().split()))
    B.sort()

    C = binary_search(A, B)

    print(sum(C))

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