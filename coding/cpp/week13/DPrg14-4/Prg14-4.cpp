/**************************************************************
 * 오류 상태를 리턴 값을 활용해                               *
 * 처리하는 프로그램                                          *
 **************************************************************/
#include <iostream>
using namespace std;

// 함수 선언
int quotient(int first, int second);

int main()
{
  int num1, num2, result;
  for(int i = 0; i < 3; i++)
  {
    cout << "정수를 입력하세요: ";
    cin >> num1;
    cout << "또 다른 정수를 입력하세요: ";
    cin >> num2;
    result = quotient(num1, num2);
    if(result == -1)
    {
      cout << "오류: 0으로 나눌 수 없음" << endl;
    }
    else
    {
      cout << "결과 = " << result << endl;
    }
  }  
  return 0;
}  

// 함수 정의
int quotient(int first, int second)
{
  if(second == 0)
  {
    return -1;
  }
  return (first / second);
}