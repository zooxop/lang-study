/**************************************************************
 * 0으로 나누었을 때 중단되는 프로그램                        *
 **************************************************************/
#include <iostream>
using namespace std;

int main()
{
  int num1, num2, result;
  for(int i = 0; i < 5; i++)
  {
    cout << "정수를 입력하세요: ";
    cin >> num1;
    cout << "또 다른 정수를 입력하세요: ";
    cin >> num2;
    result = num1/num2; // 예외를 발생시킬 수 있는 표현식
    cout << "결과 = " << result << endl;
  } 
  return 0;
} 