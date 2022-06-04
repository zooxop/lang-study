/**************************************************************
 * Stack 클래스를 사용해보는 애플리케이션 파일                *
 **************************************************************/
#include "stack.cpp"

int main()
{

    Stack<char> stack(3);
    stack.push('B');
    stack.push('C');
    stack.push('A');
    stack.push('D');  // 스택이 꽉 차서 더이상 출력할 수 없습니다. 출력.
    cout << stack.pop() << endl;
    cout << stack.pop() << endl;
//   Stack<int> stack(10);
//   stack.push(5);
//   stack.push(6);
//   stack.push(7);
//   stack.push(3);
//   cout << stack.pop() << endl;
//   cout << stack.pop() << endl;
  return 0;
}