N = list(map(int, input()))
numbers = [0] * 10

# TC: O(9*N)  // list.count()의 TC가 O(N)임.
for i in range(0, 10):
    numbers[i] = N.count(i)  # count() : 순차탐색을 사용하므로 O(N)

numbers[6] = (numbers[6]+numbers[9]+1)//2
numbers[9] = 0

print(max(numbers))


"""
pseudo code
N = input() 입력 받기
리스트 선언 : 입력받은 N에서 0~9까지 숫자의 갯수를 저장
리스트의 6번과 9번의 값을 합산한 다음 2로 나눠서 필요한 세트 수 계산하기.
리스트의 최댓값 출력
"""
