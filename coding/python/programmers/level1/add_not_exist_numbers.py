numbers = [1, 2, 3, 4, 6, 7, 8, 0]  # 14
numbers2 = [5, 8, 4, 0, 6, 7, 9]  # 6

result = 45
for i in numbers:
    result -= i

print(result)


# 개고수의 한줄 코드 :
# 45 - sum(numbers)
