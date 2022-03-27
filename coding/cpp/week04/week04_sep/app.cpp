#include "circle.h"
int main()
{
    //Circle circle0(-9.1);
  // circle1 인스턴스화 후에 멤버 함수 호출
  Circle circle1(5.2);
  cout << "반지름: " << circle1.getRadius() << endl;
  cout << "넓이: " << circle1.getArea() << endl;
  cout << "둘레: " << circle1.getPerimeter() << endl << endl;
  // circle2 인스턴스화 후에 멤버 함수 호출
  Circle circle2(circle1); 
  cout << "반지름: " << circle2.getRadius() << endl;
  cout << "넓이: " <<  circle2.getArea() << endl;
  cout << "둘레: " << circle2.getPerimeter() << endl << endl;
  // circle3 인스턴스화 후에 멤버 함수 호출
  Circle circle3; 
  cout << "반지름: " << circle3.getRadius() << endl;
  cout << "넓이: " <<  circle3.getArea() << endl;
  cout << "둘레: " << circle3.getPerimeter() << endl << endl;
  // 소멸자 호출 시점
  return 0;
}