def solution(new_id):
    temp = new_id.lower()
    answer = ""

    for i in temp:
        if i in ['-', '_', '.'] or i.isdigit() or i.isalpha():
            answer += i

    while ".." in answer:
        answer = answer.replace("..", ".")

    answer = list(answer)

    if answer[0] == '.' and len(answer) == 1:
        answer.clear()
    elif answer[0] == '.':
        answer = answer[1:]

    if len(answer) > 1 and answer[-1] == '.':
        answer = answer[:-1]

    if not answer:
        answer.append('a')

    if answer.__len__() > 15:
        answer = answer[:15]
    elif answer.__len__() <= 2:
        while answer.__len__() < 3:
            answer.append(answer[-1])

    return ''.join(answer).strip('.')


print(solution("@..........da..sda@@"))
print(solution("...!@BaT#*..y.abcdefghijklm"))
# ... ... ... ...
# .. .. .. .. .. .. .
# .. .. .. .
# .. ..