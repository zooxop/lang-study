def solution(num, total):
    answer = []
    mid = total // num
    start = mid - num // 2
    end = mid + num // 2

    if num % 2 == 0:
        start += 1

    for i in range(start, end+1):
        answer.append(i)

    return answer


print(solution(3, 12))  # [3, 4, 5]
print(solution(5, 5))  # [-1, 0, 1, 2, 3]
print(solution(4, 14))  # [2, 3, 4, 5]
