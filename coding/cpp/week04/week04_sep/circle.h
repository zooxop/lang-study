#pragma once

/**************************************************************
 * 객체 지향 프로그래밍에서 클래스를 사용하는 예              *
 **************************************************************/
#include <iostream>
#include <cassert>
using namespace std;

/**************************************************************
 * 클래스 정의                                                *
 * 매개변수 생성자, 기본 생성자,                              * 
 * 복사 생성자, 소멸자, 멤버 함수를 선언                      *
***************************************************************/
class Circle
{
  private: 
  //mutable double radius;  //const 멤버함수에서, 멤버 변수의 값을 수정할 수 있게 해주는 키워드 mutable
   double radius;                                                               
  public:
   Circle(double radius);           // 매개변수가 있는 생성자
   Circle();                        // 기본 생성자
   ~Circle();                       // 소멸자
   Circle(const Circle& circle);    // 복사 생성자
   void setRadius(double radius);   // 설정자
   double getRadius() const;        // 접근자
   double getArea() const;          // 접근자             
  double getPerimeter() const;       // 접근자
};