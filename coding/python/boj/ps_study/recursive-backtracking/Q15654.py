def dfs(depth):
    if depth == M:
        print(' '.join(map(str, visited)))
    else:
        for num in arr:
            if num not in visited:
                visited.append(num)
                dfs(depth+1)
                visited.pop()


N, M = map(int, input().split())
arr = list(map(int, input().split()))
arr.sort()
visited = []
dfs(0)
