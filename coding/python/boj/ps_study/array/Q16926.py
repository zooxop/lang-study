N, M, R = map(int, input().split(' '))
arr = [list(map(int, input().split(' '))) for _ in range(N)]

# TC: O(r)
for _ in range(R):
    for i in range(min(N, M) // 2):  # TC: O(min(N, m) // 2)
        x = i
        y = i
        temp = arr[x][y]

        # TC: O(n) -> O(2)
        for j in range(i + 1, N - i):  # left
            x = j
            pre = arr[x][y]
            arr[x][y] = temp
            temp = pre

        # TC: O(m) -> O(2)
        for j in range(i + 1, M - i):  # down
            y = j
            pre = arr[x][y]
            arr[x][y] = temp
            temp = pre

        # TC: O(n) -> O(2)
        for j in range(i + 1, N - i):  # right
            x = N - j - 1
            pre = arr[x][y]
            arr[x][y] = temp
            temp = pre

        # TC: O(m) -> O(2)
        for j in range(i + 1, M - i):  # up
            y = M - j - 1
            pre = arr[x][y]
            arr[x][y] = temp
            temp = pre

for i in range(N):
    for j in range(M):
        print(arr[i][j], end=' ')
    print()

"""
[pseudo code]
N, M, R = input()  # 배열의 크기 N: row, M: col / 회전수 R
arr = 배열 입력받기
for _ to R do  # 회전수만큼 반복
    for _ to 회전할 그룹 수 do
        for _ to 좌측으로 이동할 원소 do
            현재 회전 그룹에서 좌측으로 이동해야 하는 원소들을 한 칸씩 이동.
        endfor
        
        for _ to 하단으로 이동할 원소 do
            현재 회전 그룹에서 하단으로 이동해야 하는 원소들을 한 칸씩 이동.
        endfor
        
        for _ to 우측으로 이동할 원소 do
            현재 회전 그룹에서 우측으로 이동해야 하는 원소들을 한 칸씩 이동.
        endfor
        
        for _ to 상단으로 이동할 원소 do
            현재 회전 그룹에서 상단으로 이동해야 하는 원소들을 한 칸씩 이동.
        endfor 
    endfor
endfor

회전한 배열(결과) 출력.

"""
