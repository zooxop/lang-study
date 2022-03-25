N = int(input())
results = list(map(int, input().split()))
maxValue = max(results)
sumResults = 0

for result in results:
    sumResults += (result/maxValue) * 100

print(sumResults / N)
