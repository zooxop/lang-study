A = int(input())
B = int(input())
C = int(input())

result = list(str(A * B * C)) # A*B*C를 String 으로 형변환 한 뒤, 배열로 반환.

for i in range(10):
    print(result.count(str(i)))
