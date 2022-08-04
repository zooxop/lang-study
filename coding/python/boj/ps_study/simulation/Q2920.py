def solution(arr):
    for i in range(0, len(arr) - 1):
        if abs(arr[i] - arr[i+1]) > 1:
            return "mixed"

    if arr[0] - arr[1] < 0:
        return "ascending"
    else:
        return "descending"


print(solution(list(map(int, input().split()))))
