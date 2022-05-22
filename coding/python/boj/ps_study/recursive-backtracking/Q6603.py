answer = [0] * 6


def dfs(start, depth):
    if depth == 6:
        for x in answer:
            print(x, end=" ")
        print()
        return

    for i in range(start, size):
        answer[depth] = numbers[i]
        dfs(i+1, depth+1)


while True:
    numbers = list(map(int, input().split()))
    if numbers[0] == 0 and len(numbers) == 1:
        break

    size = numbers.pop(0)
    dfs(0, 0)
    print()


"""pseudo code
numbers = 입력받은 숫자를 갖고 있는 list
size = 입력받은 숫자의 갯수를 갖고 있는 변수
answer = 결과 출력용 6칸짜리 list

1. dfs 설계
 - dfs(start, depth)
  - start : 함수 내부에서 answer[] 원소 구성을 위한 반복시, i 값 할당을 위함.
  - depth : 현재 재귀의 단계를 갖고 있음.
if depth == 6 then
    answer 출력
    return

for start to size do
    answer[depth] = numbers[i] 할당
    dfs(i+1, depth+1)
end for  
"""