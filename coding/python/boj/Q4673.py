selfNumbers = set()
naturalNumbers = set(range(1, 10001))

for i in range(1, 10001):
    temp = i
    for j in str(i):
        temp += int(j)
    selfNumbers.add(temp)

answer = sorted(naturalNumbers - selfNumbers)

for i in answer:
    print(i)
    