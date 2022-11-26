def solution(babbling):
    answer = 0
    available = ["aya", "ye", "woo", "ma"]

    for i in range(len(babbling)):
        temp = babbling[i]

        for text in available:
            temp = temp.replace(text, " ")

        temp = temp.replace(" ", "")

        if len(temp) == 0:
            answer += 1

    return answer


print(solution(["aya", "yee", "u", "maa", "wyeoo"]))  # 1
print(solution(["ayaye", "uuuma", "ye", "yemawoo", "ayaa"]))  # 3
