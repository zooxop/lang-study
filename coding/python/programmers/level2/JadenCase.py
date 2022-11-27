def solution(s):
    answer = ''
    temp = s.lower().split(" ")

    for txt in temp:
        if txt == '':
            answer += " "
        else:
            answer += txt[0].upper() + txt[1:] + " "

    if answer[-1] == ' ':
        answer = answer[0:-1]

    return answer


print(solution("3people   unFollowed   me  "))  # 3people Unfollowed Me
print(solution("for the last week"))  # For The Last Week
print(solution("p pp"))
