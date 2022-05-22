import sys

L, C = map(int, sys.stdin.readline().split())
alphabets = list(sys.stdin.readline().split())
answer = ["a"] * L


def dfs(start, depth):
    if depth == L:
        vowels = 0  # 모음
        consonants = 0  # 자음
        for x in answer:
            if x in 'aeiou':
                vowels += 1
            else:
                consonants += 1

        if vowels >= 1 and consonants >= 2:
            print(''.join(answer))
        return

    for i in range(start, C):
        answer[depth] = alphabets[i]
        dfs(i+1, depth+1)


alphabets.sort()
dfs(0, 0)


"""pseudo code
1. dfs를 통한 전체탐색
2. 결과 출력 시, 자음 >= 2 and 모음 >= 1 조건을 체크.
3. 입력 내용을 정렬해야 함.

L = 출력할 암호의 갯수, C = 입력받을 알파벳의 갯수 입력.
alphabets = 알파벳 리스트 입력.
answer = 길이 L의 리스트 선언.

alphabets 정렬.

1. dfs 설계
 - dfs(start, depth)
  - start : 함수 내부에서 answer[] 원소 구성을 위한 반복시, i 값 할당을 위함.
  - depth : 현재 재귀의 단계를 갖고 있음.
if depth == L then
    if answer[] 의 원소(알파벳)들의 조합이 자음이 2개 이상이며 모음이 1개 이상인지 then
        print(answer)
    
    for start to C do
        answer[depth] = alphabets[i]
        재귀 dfs(i+1, depth+1) 호출
    end for
    
dfs(0, 0)
"""