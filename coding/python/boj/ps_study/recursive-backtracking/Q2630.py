N = int(input())
arr = [[0] * N for _ in range(N)]  # N*N 행렬 생성 및 0으로 초기화.
result = []  # 결과 출력을 위한 리스트

# TC: O(N)
for n in range(N):
    arr[n] = list(map(int, input().split()))

# arr[0] = [1, 1, 0, 0, 0, 0, 1, 1]
# arr[1] = [1, 1, 0, 0, 0, 0, 1, 1]
# arr[2] = [0, 0, 0, 0, 1, 1, 0, 0]
# arr[3] = [0, 0, 0, 0, 1, 1, 0, 0]
# arr[4] = [1, 0, 0, 0, 1, 1, 1, 1]
# arr[5] = [0, 1, 0, 0, 1, 1, 1, 1]
# arr[6] = [0, 0, 1, 1, 1, 1, 1, 1]
# arr[7] = [0, 0, 1, 1, 1, 1, 1, 1]


# 재귀(분할정복)
def recursive(x, y, size):
    color = arr[x][y]  # 현재 좌표의 값을 기준으로 결정.

    for i in range(x, x+size):
        for j in range(y, y+size):
            if arr[i][j] != color:  # 기준값과 다른값이 있다면 현재 상태를 1/4로 분할하여 재귀 탐색
                recursive(x, y, size//2)  # 2사분면
                recursive(x, y+size//2, size//2)  # 1사분면
                recursive(x+size//2, y, size//2)  # 3사분면
                recursive(x+size//2, y+size//2, size//2)  # 4사분면
                return

    result.append(color)  # 현재 기준값을 리스트에 추가. (= 종이의 갯수)


recursive(0, 0, N)
print(result.count(0))
print(result.count(1))


""" pseudo code
1. N 입력 및 N*N의 2차원 리스트 arr 생성
    1.1 arr[0][0] ~ arr[N-1][N-1] 까지 0 혹은 1을 입력받는다.
2. dfs, 분할 정복을 통해 문제 해결
3. dfs 구현
    def dfs(x, y, size) {
        1. 기준값 = arr[x][y]
        
        2. 반복 횟수 기준 : 현재좌표 to 최대 사이즈 
        for i in range(x, x+size){
            for j in range(y, y+size){
                3. if 기준값 != arr[i][j] then
                    4. 현재의 평면을 4분할.
            }
        }
    }
    
탐색 시작 : dfs(0, 0, size) 

"""