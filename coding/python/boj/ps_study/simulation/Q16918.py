# 입력받은 x, y 좌표와 좌표의 동,서,남,북에 폭탄 존재 여부 체크.
def isBombClose(_arr, x, y):
    if _arr[x][y] == 'O':
        return True

    if x+1 < R and _arr[x+1][y] == 'O':
        return True

    if x-1 >= 0 and _arr[x-1][y] == 'O':
        return True

    if y+1 < C and _arr[x][y+1] == 'O':
        return True

    if y-1 >= 0 and _arr[x][y-1] == 'O':
        return True

    return False


R, C, N = map(int, input().split())
arr = [list(input()) for _ in range(R)]

if N <= 1:  # 1 이하일 땐 입력값 그대로 출력.
    for temp in arr:
        print(''.join(temp))
elif N % 2 == 0:  # 짝수일 땐 모든 칸을 폭탄으로 출력.
    for _ in range(0, R):
        for _ in range(0, C):
            print('O', end='')
        print()
else:
    # 첫 번째 폭탄이 터진 후의 상태 저장용.
    bombs1 = [['O'] * C for _ in range(R)]

    for i in range(0, R):
        for j in range(0, C):
            if isBombClose(arr, i, j):  # 첫 번째 폭탄과 인접 여부 체크.
                bombs1[i][j] = '.'
            else:
                bombs1[i][j] = 'O'

    if N % 4 == 3:  # 3,7,11... 초 일때는 bombs1(첫 번째 폭탄이 터진 직후 상태) 출력
        for temp in bombs1:
            print(''.join(temp))
    elif N % 4 == 1:  # 5,9,13... 초 일때는 두 번째 폭탄이 터진 직후 상태를 출력.
        for i in range(0, R):
            for j in range(0, C):
                if isBombClose(bombs1, i, j):  # 인접 여부 체크 시, bombs1 상태를 기준으로 체크한다.
                    print('.', end='')
                else:
                    print('O', end='')
            print()


"""pseudo code
1. N <= 1 -> 입력값 그대로 출력
2. N % 2 == 0 -> (짝수) 전부 폭탄으로 출력
3. N > 1 ->
  3.1. N % 4 == 3 -> (3초, 7초, 11초..) 첫번째 폭탄이 터짐. 범위 밖에는 두번째 폭탄 존재.
  3.2. N % 4 == 1 -> (5초, 9초, 13초..) 두번째 폭탄이 터짐. 범위 밖에는 첫번째 폭탄 존재.
  
위 4가지의 경우를, 입력받은 N값에 따라 다르게 출력할 수 있도록 구현하였다.


if N <= 1 then
    - 입력받은 arr 상태 그대로 출력.
else if N % 2 == 0 then
    - 모든 칸을 'O'로 출력.
else
    - bombs1 = 입력받은 arr 기준, 첫 번째 폭탄이 터진 직후의 상태.
    
    if N % 4 == 3 then
        - bombs1 출력
    else if N % 4 == 1 then
        - bombs1 기준, 두 번째 폭탄이 터진 직후의 상태 출력.  
"""