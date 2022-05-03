N = int(input())
parrots = []

for _ in range(N):  # 앵무새's says 입력
    parrots.append(list(input().split()))

write = list(input().split())
result = "Possible"

# TC: O(N) N: 받아쓰기한 단어 개수
for temp in write:
    word = ""

    # TC: O(M) M: 앵무새 마리수
    for x in parrots:
        if x[0] == temp:
            word = x.pop(0)
            if x.__len__() == 0:  # 할 말 다 했으면 돌아간다.
                idx = parrots.index(x)
                del parrots[idx]  # 잘가
            break  # 단어를 찾았다면 반복 탈출

    if temp != word:  # 단어를 queue에서 가져오지 못했다면 impossible
        result = "Impossible"
        break

if parrots:  # 아직 앵무찡이 할말이 남아있다면 impossible
    result = "Impossible"

print(result)


""" pseudo code
N = 앵무새 마리수 입력

for _ to N do
    앵무새's says를 리스트에 append
endfor

write = 받아쓰기 입력

for temp to write do (temp: 받아쓰기한 단어)
    for 앵무새 to 앵무새들 do
        1. 현재 앵무새가 갖고 있는 가장 첫번째 단어와 temp 비교
        2. 모든 앵무새를 체크 후, 단어를 찾을 수 없다면 "Impossible"
    endfor
endfor

아직 할말이 남은 앵무새가 있다면 "Impossible"
"""