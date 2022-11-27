def solution(s):
    temp = sorted(map(int, s.split()))

    return str(temp[0]) + " " + str(temp[-1])


print(solution("1 2 3 4"))  # "1 4"
print(solution("-1 -2 -3 -4"))
