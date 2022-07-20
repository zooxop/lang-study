from queue import PriorityQueue

N = int(input())
dasom = int(input())

result = 0
que = PriorityQueue()

for _ in range(0, N-1):
    val = int(input())
    que.put((-val, val))

while not que.empty():
    temp = que.get()[1]
    if temp >= dasom:
        dasom += 1
        result += 1
        temp -= 1

    if temp >= dasom:
        que.put((-temp, temp))

print(result)
