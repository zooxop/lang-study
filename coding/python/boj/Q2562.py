numbers = []

for i in range(0, 9):
    numbers.append(int(input()))

maxVal = max(numbers)
maxIndex = numbers.index(maxVal) + 1

print(maxVal, maxIndex, sep='\n')
