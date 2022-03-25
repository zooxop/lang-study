C = int(input())
outputs = []

for case in range(0, C):
    inputVal = list(map(int, input().split()))
    cnt = inputVal.pop(0)
    avg = sum(inputVal) / cnt

    higherCnt = 0
    for score in inputVal:
        if score > avg:
            higherCnt += 1

    rate = (higherCnt / cnt) * 100
    print(f'{rate:.3f}%')
