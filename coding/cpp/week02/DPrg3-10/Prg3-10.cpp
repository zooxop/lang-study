/***********************************************************
 * 자료형이 섞인 표현식의 자료형 변환 확인하기             *
 ***********************************************************/
#include <iostream>
#include <typeinfo>
using namespace std;
//#형변환
int main()
{
  // 선언
  int x;
  double y;
  // 할당
  x = 23.67;
  y = 130;
  // x의 자료형과 값 확인
  cout << "x = 23.67의 자료형: " << typeid(x = 23.67).name() << endl;
  cout << "할당 후 x의 값: " << x << endl
       << endl;
  // y의 자료형과 값 확인
  cout << "y = 130의 자료형: " << typeid(y = 130).name() << endl;
  cout << "할당 후 y의 값: " << y << endl;

  int a = 7;
  double b = 3.9;
  cout << a + b << endl;                   // double 타입으로 Up casting이 되므로, 10.9를 출력함.
  cout << a + int(b) << endl;              //사용시 주의해야함.
  cout << a + (int)b << endl;              //사용시 주의해야함.
  cout << a + static_cast<int>(b) << endl; //권장되는 스타일

  return 0;
}