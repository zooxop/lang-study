ss = "cdcd"
s1 = "baabaa"
s2 = "asdffdsa"


def solution(s):
    stack = [s[0]]
    for i in range(1, len(s)):
        if stack:
            if len(stack) > 0 and stack[-1] != s[i]:
                stack.append(s[i])
            elif len(stack) > 0:
                stack.pop(-1)
        else:
            stack.append(s[i])

    if stack:
        return 0
    else:
        return 1


print(solution(s1))
