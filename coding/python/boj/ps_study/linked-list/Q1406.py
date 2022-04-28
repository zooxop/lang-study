left = list(input())
right = []

M = int(input())

# TC: O(M)
for _ in range(M):
    command = list(input().split())

    if command[0] == 'L':
        if left:  # 리스트가 비어있는지 아닌지 체크
            right.append(left.pop())
    elif command[0] == 'D':
        if right:
            left.append(right.pop())
    elif command[0] == 'B':
        if left:
            left.pop()
    else:
        left.append(command[1])

left.extend(reversed(right))
print(''.join(left))

""" Pseudo code
left = input, list (최초 입력 문자열)
right = list
M = input, int (입력받을 키 갯수)

for 0 to M do
    command = input, list (L,D,B는 단일 값 / P는 split으로 입력값이 추가로 들어옴.)
        
    if _ == 'L' then
        리스트 right에 left.pop() 값을 append
    else if _ == 'D' then
        리스트 left에 right.pop() 값을 append
    else if _ == 'B' then
        리스트 left를 pop()
    else
        리스트 left에 현재 값 command[1] 을 append
endfor

리스트 left에 right 리스트를 뒤집어서 extend

print(left)
"""