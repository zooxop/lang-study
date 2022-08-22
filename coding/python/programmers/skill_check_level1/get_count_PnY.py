def solution(s):
    s = s.lower()
    cnt_p = s.count("p")
    cnt_y = s.count("y")

    if cnt_p == cnt_y:
        return True
    else:
        return False


print(solution("pPoooyY"))
print(solution("Pyy"))
