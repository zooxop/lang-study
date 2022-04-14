def binSearch(arr, target):
    arr.sort()
    length = len(arr)
    left = 0
    right = length - 1

    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == target:
            return mid
            break
        elif arr[mid] > target:
            right = mid - 1
        else:
            left = mid + 1
    return mid


B = 26
m_list = [30, 94, 27, 92, 21, 37, 25, 47, 25, 53, 98, 19, 32, 32, 7]

print(binSearch(m_list, B))
