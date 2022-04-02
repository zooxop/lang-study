word = input().lower()  # input 및 소문자로 변환
arr = [0] * 26  #알파벳 갯수만큼 선언 및 초기화

for i in word:
    idx = ord(i) - 97
    arr[idx] += 1

if arr.count(max(arr)) > 1:  # array.count() = 전달받은 인자를 요소로 갖고 있는 배열의 갯수를 리턴.
    print('?')
else:
    maxIndex = arr.index(max(arr))
    print(chr(maxIndex+65))
