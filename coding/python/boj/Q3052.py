array = [0] * 42  # 배열(리스트) 선언과 함께 0으로 초기화.
count = 0

for i in range(10):
    remain = int(input()) % 42
    if array[remain] == 0:
        array[remain] = 1
        count += 1

print(count)
