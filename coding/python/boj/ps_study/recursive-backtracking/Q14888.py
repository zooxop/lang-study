def dfs(depth):
    global _max, _min

    if depth == (N-1):
        if visited[-1] > _max:
            _max = visited[-1]
        if visited[-1] < _min:
            _min = visited[-1]
        return

    for index in range(0, 4):
        if operators[index] > 0:
            operators[index] -= 1

            if index == 0:
                visited.append(visited[-1] + seq[depth + 1])
            elif index == 1:
                visited.append(visited[-1] - seq[depth + 1])
            elif index == 2:
                visited.append(visited[-1] * seq[depth + 1])
            elif index == 3:
                if visited[-1] < 0:
                    visited.append(-(abs(visited[-1]) // seq[depth + 1]))
                else:
                    visited.append(visited[-1] // seq[depth + 1])
            dfs(depth+1)
            visited.pop()
            operators[index] += 1


N = int(input())
seq = list(map(int, input().split()))
operators = list(map(int, input().split()))  # 덧셈, 뺄셈, 곱셈, 나눗셈
visited = [seq[0]]

_max = float('-inf')
_min = float('inf')

dfs(0)

print(_max)
print(_min)

