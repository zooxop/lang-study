lottos = [44, 1, 0, 0, 31, 25]
win_nums = [31, 10, 45, 1, 6, 19]

answer = []
temp = []

same_cnt = 0
zero_cnt = lottos.count(0)
for i in range(lottos.__len__()):
    if lottos[i] in win_nums:
        same_cnt += 1
        lottos[i] = -1
        temp.append(lottos[i])

if same_cnt > 1:
    same_cnt -= 1
elif same_cnt == 1:
    same_cnt = 0

_max = 6 - same_cnt - zero_cnt
_min = 6 - same_cnt

if _max < 1:
    _max = 1

if _min > 6:
    _min = 6

answer.append(_max)
answer.append(_min)

print(answer)


""" 개고수가 짠거
def solution(lottos, win_nums):
    rank=[6,6,5,4,3,2,1]

    cnt_0 = lottos.count(0)
    ans = 0
    for x in win_nums:
        if x in lottos:
            ans += 1
    return rank[cnt_0 + ans],rank[ans]
"""