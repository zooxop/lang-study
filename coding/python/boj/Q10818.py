N = int(input())
numbers = list(map(int, input().split()))
print(min(numbers), max(numbers))

'''
N = int(input())
numbers = list(map(int, input().split()))
maxVal = numbers[0]
minVal = numbers[0]

for i in numbers[1:]:  # numbers[1] 부터 끝까지
    if i > maxVal:
        maxVal = i
    elif i < minVal:
        minVal = i

print(minVal, maxVal)
'''
