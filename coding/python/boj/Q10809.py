## 2
S = input()
output = [-1] * 26

for i in S:
    idx = ord(i) - 97
    output[idx] = S.find(i)

for i in output:
    print(i, end=' ')

## 1
# S = input()
# alphabet = range(ord('a'), ord('z')+1)
#
# for i in alphabet:
#     print(S.find(chr(i)), end=' ')
