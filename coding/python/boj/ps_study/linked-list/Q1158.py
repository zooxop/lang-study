from collections import deque

N, K = map(int, input().split())
numbers = deque([i for i in range(1, N+1)])
answer = []

# TC: O(N)
while numbers:
    numbers.rotate(0-K)  # 리스트 회전 (TC: O(K) (공식문서 피셜) 왜 O(N)이 아니라 O(K)인지는 모르겠음.)
    answer.append(numbers.pop())

print('<', end="")
print(*answer, sep=", ", end="")
print('>')

""" pseudo code
N, K = input (순열의 길이 / 요세푸스 값)
numbers = deque(1 부터 N 까지 순차적으로 값 초기화)
answer = []

for _ do N do
    numbers 리스트를 왼쪽으로 K만큼 회전
    answer.append(numbers.pop())
endfor

print(answer)

"""