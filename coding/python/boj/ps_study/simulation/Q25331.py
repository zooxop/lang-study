import copy


def fall_balls():
    for j in range(0, 7):
        for k in range(0, 7):
            for i in range(1, 7):
                if grid[i][j] == 0 and grid[i-1][j] > 0:
                    grid[i][j] = grid[i-1][j]
                    grid[i-1][j] = 0


def remove_balls():
    remove_list = []

    # 수직 그룹 체크
    for i in range(0, 7):
        ver_cnt = 0
        for j in range(0, 7):
            if grid[j][i] > 0:
                ver_cnt += 1
        if ver_cnt > 0:
            for j in range(0, 7):
                if grid[j][i] == ver_cnt:
                    remove_list.append((j, i))

    # 수평 그룹 체크
    for i in range(0, 7):
        hor_cnt = 0
        for j in range(0, 7):
            if grid[i][j] > 0:
                hor_cnt += 1
                if j == 6:
                    for x in range(hor_cnt, 0, -1):
                        if grid[i][j-x+1] == hor_cnt:
                            remove_list.append((i, j-x+1))
            elif j == 0:
                continue
            elif hor_cnt > 0:
                for x in range(hor_cnt, 0, -1):
                    if grid[i][j-x] == hor_cnt:
                        remove_list.append((i, j-x))
                hor_cnt = 0

    # 제거대상 삭제처리
    for i, j in remove_list:
        grid[i][j] = 0

    # 더 이상 제거할 수 없으면 False
    if len(remove_list) > 0:
        return True
    else:
        return False


# main 시작
grid_input = [list(map(int, input().split())) for _ in range(7)]
grid = copy.deepcopy(grid_input)
N = int(input())
_min = float('inf')

for idx in range(0, 7):
    count = 0

    # 공을 한 번씩 다 떨어뜨려본다.
    grid[0][idx] = N

    fall_balls()
    while remove_balls():
        fall_balls()

    for _i in range(0, 7):
        for _j in range(0, 7):
            if grid[_i][_j] > 0:
                count += 1

    if _min > count:
        _min = count

    if _min == 0:
        break

    grid = copy.deepcopy(grid_input)

print(_min)
