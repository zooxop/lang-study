N = int(input())

# TC: O(N)
for _ in range(N):
    case = list(input())
    left, right = [], []

    # TC: O(N) (N은 입력받은 문자열의 길이)
    for temp in case:
        if temp == '<':
            if left:  # 리스트가 비어있는지 아닌지 체크
                right.append(left.pop())
        elif temp == '>':
            if right:
                left.append(right.pop())
        elif temp == '-':
            if left:
                left.pop()
        else:
            left.append(temp)

    left.extend(reversed(right))

    print(''.join(left))


""" Pseudo code
N = input (테스트 케이스 개수)
for 0 to N do
    case = input (문자열 입력)
    
    for _ to case do (입력받은 case의 모든 문자 검사)
        if _ == '<' then
            리스트 right에 left.pop() 값을 append
        else if _ == '>' then
            리스트 left에 right.pop() 값을 append
        else if _ == '-' then
            리스트 left를 pop()
        else
            리스트 left에 현재 값 _ 을 append
    endfor
    
    리스트 left에 right 리스트를 뒤집어서 extend
    
    print(left)
endfor
"""



'''
순차탐색 방식을 사용한 코드 (시간초과 발생)
for _ in range(N):
    case = list(input())
    cursor = 0
    answer = []
    for temp in case:
        if temp == "<" and cursor > 0:
            cursor = cursor - 1
        elif temp == ">" and cursor < len(answer):
            cursor = cursor + 1
        elif temp == "-" and cursor <= len(answer) > 0 and (cursor-1) > 0:
            answer.pop(cursor-1)
            cursor = cursor - 1
        elif temp not in ['<', '>', '-']:
            answer.insert(cursor, temp)  # list.insert() 의 시간복잡도는 O(N) 이므로, 시간 복잡도가 상승함.
            cursor = cursor + 1
            
    print(*answer, sep="")
'''