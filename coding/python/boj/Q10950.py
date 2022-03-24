T = int(input())
resultList = []

for i in range(0, T):
    A, B = map(int, input().split())
    resultList.append(A + B)

for i in resultList:
    print(i)
