# 미세먼지 확산
def spread():
    # 상, 하, 좌, 우
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]

    temp = [[0] * C for _ in range(R)]
    for i in range(R):
        for j in range(C):
            if room[i][j] != 0 and room[i][j] != -1:
                value = 0
                for k in range(4):
                    nx = i + dx[k]
                    ny = j + dy[k]
                    if 0 <= nx < R and 0 <= ny < C and room[nx][ny] != -1:
                        temp[nx][ny] += room[i][j] // 5
                        value += room[i][j] // 5
                room[i][j] -= value

    for x in range(R):
        for y in range(C):
            room[x][y] += temp[x][y]


def cleaning(cleaner, dx, dy):
    direct = 0
    before = 0
    x, y = cleaner, 1
    while True:
        nx = x + dx[direct]
        ny = y + dy[direct]
        if x == cleaner and y == 0:
            break
        if not 0 <= nx < R or not 0 <= ny < C:
            direct += 1
            continue
        room[x][y], before = before, room[x][y]
        x = nx
        y = ny


R, C, T = map(int, input().split())
room = [list(map(int, input().split())) for _ in range(R)]
top = 0
bottom = 0

# 공기 청정기 위치 확인
for i in range(R):
    if room[i][0] == -1:
        top = i
        bottom = i + 1
        break

for _ in range(T):
    spread()  # 미세먼지 확산
    cleaning(top, [0, -1, 0, 1], [1, 0, -1, 0])  # dx, dy = 반시계 방향
    cleaning(bottom, [0, 1, 0, -1], [1, 0, -1, 0])  # dx, dy = 시계 방향

result = 0
for i in range(R):
    for j in range(C):
        if room[i][j] > 0:
            result += room[i][j]

print(result)
