N = int(input())
arr = []
alpha = [0] * 26

for _ in range(0, N):
    text = input()
    arr.append(list(text))
    _len = len(text)

    for idx, temp in enumerate(text):
        val = _len - idx
        alpha[ord(temp)-65] += pow(10, val-1)

change_value = 9

while True:
    _max = max(alpha)
    _idx = alpha.index(_max)
    if _max == 0:
        break

    max_alpha = chr(65+_idx)

    for i in range(len(arr)):
        for j in range(len(arr[i])):
            if arr[i][j] == max_alpha:
                arr[i][j] = str(change_value)

    change_value -= 1
    alpha[_idx] = 0

_sum = 0
for temp in arr:
    _sum += int(''.join(temp))

print(_sum)
