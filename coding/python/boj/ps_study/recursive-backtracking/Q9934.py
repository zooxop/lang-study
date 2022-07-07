def dfs(depth, _tree):  # 중위 순회 dfs 알고리즘
    if depth == K:
        return

    root_idx = len(_tree) // 2
    result[depth].append(_tree[root_idx])

    dfs(depth+1, _tree[0:root_idx])
    dfs(depth + 1, _tree[root_idx+1:])


K = int(input())
tree = list(map(int, input().split()))
result = [[] * i for i in range(K)]

dfs(0, tree)

for temp in result:
    for i in temp:
        print(i, end=' ')
    print()
