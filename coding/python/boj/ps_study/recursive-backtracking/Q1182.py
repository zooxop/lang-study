N, S = map(int, input().split())
numbers = list(map(int, input().split()))
count = 0


def dfs(index, _sum):
    global count

    if index >= N:
        return

    _sum += numbers[index]
    if _sum == S:
        count += 1

    # 이번 숫자를 더한 경우
    dfs(index + 1, _sum)
    # 이번 숫자를 더하지 않은 경우
    dfs(index + 1, _sum - numbers[index])


dfs(0, 0)
print(count)
