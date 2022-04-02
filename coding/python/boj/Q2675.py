T = int(input())

for i in range(0, T):
    R, S = input().split()
    text = ''
    for temp in S:
        text += temp * int(R)  # char 타입에 "*" 연산을 수행하면 해당 char 값이 곱한 값 만큼 반복된다.
    print(text)
