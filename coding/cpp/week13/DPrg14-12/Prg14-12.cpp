/**************************************************************
 * invalid_argument 객체를 사용해서 0으로 나눌 경우           *
 * 예외를 발생시키고 처리하는 프로그램                        *
 **************************************************************/
#include <stdexcept>
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
    // try-catch 블록
    try 
    {
      cout << "결과 = " << quotient(num1, num2);
      cout << endl;
    }
    catch(invalid_argument ex)
    {
      cout << ex.what() << endl;
    }
  } 
  return 0;
}
// 함수 정의
int quotient(int first, int second)
{
  if(second == 0)
  {
      throw invalid_argument("오류: 0으로 나눌 수 없습니다.");
  }
  return first / second;
}