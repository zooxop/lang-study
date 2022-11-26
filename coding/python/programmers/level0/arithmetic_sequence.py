def solution(common):
    temp1 = common[2] - common[1]
    temp2 = common[1] - common[0]

    if temp1 == temp2:
        answer = common[-1] + temp1
    else:
        answer = common[-1] * (temp1 // temp2)

    return answer


print(solution([1, 2, 3, 4]))  # 5
print(solution([2, 4, 8]))  # 16
