N, r, c = map(int, input().split())

# TC: O(N)
number = 0
while N != 0:
    N -= 1
    size = 2 ** N

    if r < size and c < size:  # 2사분면
        pass  # 아무것도 하지 않는다.  # 좌표 수정을 할 필요가 없음.
    elif r < size <= c:
        number += size * size  # 1사분면
        c -= size
    elif r >= size > c:
        number += size * size * 2  # 3사분면
        r -= size
    else:
        number += size * size * 3  # 4사분면
        r -= size
        c -= size

print(number)


""" pseudo code
N = 배열의 크기, r = 찾을 행, c = 찾을 열 입력.

1. 분할정복을 통해, 배열을 1/4로 분할해나가면서 반복 수행.
2. 매 반복마다, 현재 분할된 배열의 [0,0]의 값을 계산해서 number 변수에 할당.
3. 더이상 분할할 수 없을 때까지 반복. 
"""