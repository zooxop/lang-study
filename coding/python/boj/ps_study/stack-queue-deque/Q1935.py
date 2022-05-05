N = int(input())

postfix = list(input())
operand = []  # 피연산자들만 담아놓을 리스트

operators = []  # 스택

# TC: O(N)
for _ in range(N):
    operand.append(int(input()))

# TC: O(N)
for x in postfix:
    if ord(x) in range(65, 96):
        operators.append(operand[ord(x)-65])
    else:
        oper2 = operators.pop()  #순서가 중요하다.
        oper1 = operators.pop()

        if x == '+':
            operators.append(oper1 + oper2)
        elif x == '-':
            operators.append(oper1 - oper2)
        elif x == '*':
            operators.append(oper1 * oper2)
        elif x == '/':
            operators.append(oper1 / oper2)

print("{:.2f}".format(operators[0]))

""" pseudo code
1. 후위연산식 입력(list)
2. 피연산자 값 입력
3. 후위연산식을 연산할 stack 선언

for x to 후위연산식 list do
    if x가 알파벳이라면 then
        stack에 x와 매칭되는 피연산자 push
    else  # +, -, *, /
        피연산자2 = stack.pop
        피연산자1 = stack.pop
        
        stack에 피연산자1과 피연산자2를 x로 연산한 값을 push 
endfor

stack[0] 값을 print (소수점 2자리까지)
"""