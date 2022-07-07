def solution(value):
    temp = 0
    for i in range(0, len(value)):
        temp += int(value[i])

    return str(temp)


X = input()
cnt = 0

while True:
    if len(X) < 2:
        break
    X = solution(X)
    cnt += 1

print(cnt)
if int(X) % 3 == 0:
    print('YES')
else:
    print('NO')
