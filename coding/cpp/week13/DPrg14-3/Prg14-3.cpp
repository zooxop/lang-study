/**************************************************************
 * 오류 가능성을 확인하고                                     *
 * 프로그램의 중단을 막는 프로그램                            *
 **************************************************************/
#include <iostream>
using namespace std;

int main()
{
  int num1, num2, result;
  for(int i = 0; i < 4; i++)
  {
    cout << "정수를 입력하세요: ";
    cin >> num1;
    cout << "또 다른 정수를 입력하세요: ";
    cin >> num2;
    if(num2 == 0)
    {
      cout << "현재 입력으로는 처리가 불가능합니다." << endl;
    }
    else
    {
      result = num1 / num2;
      cout << "결과 = " << result << endl;
    }
  }   
  return 0;
}