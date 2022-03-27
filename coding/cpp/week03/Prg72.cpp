/**************************************************************
 * 객체 지향 프로그래밍에서 클래스를 사용하는 예              *
 **************************************************************/
#include <iostream>
using namespace std;

/**************************************************************
 * 클래스 정의                                                *
 * 매개변수 생성자, 기본 생성자,                              * 
 * 복사 생성자, 소멸자, 멤버 함수를 선언                      *
***************************************************************/
class Circle
{
  private: 
   double radius;                                                               
  public:
   Circle(double radius);
   Circle();                        // 기본 생성자
   ~Circle();                       // 소멸자
   void setRadius(double radius);   // 설정자
   double getRadius() const;        // 접근자
   double getArea() const;          // 접근자             
  double getPerimeter() const;       // 접근자
};
/*************************************************************
 * 멤버 함수 정의                                            *
 * 매개변수가 있는 생성자, 기본 생성자,                      * 
 * 복사 생성자, 소멸자, 멤버 함수를 정의                     *
 *************************************************************/
// 기본 생성자의 정의
Circle::Circle() : radius(0.0)  // ": radius(0.0)" => 기본값 할당
{
    //this.radius = 0.0;  => 자바의 생성자 기본값 할당 해주는 코딩 스타일.
  cout << "기본 생성자가 호출되었습니다." << endl;
}

// # 매개변수 있는 생성자 사용방법 #2
// Circle::Circle(double radius)
// {
//   this->radius = radius; 
//   cout << "기본 생성자가 호출되었습니다." << endl;
// }

Circle::Circle(double radius) : radius(radius)
{
    cout << "매개변수 있는 생성자가 호출되었습니다." << endl;
}

// 소멸자의 정의
Circle::~Circle()
{
  cout << "소멸자가 호출되었습니다." << radius;
  cout << endl;
}
// setRadius 멤버 함수의 정의
void Circle::setRadius(double value)
{
  radius = value;
}
// getRadius 멤버 함수의 정의
double Circle::getRadius() const
{
  return radius;
}
// getArea 멤버 함수의 정의
double Circle::getArea() const
{
  const double PI = 3.14; 
  return (PI * radius * radius);
}
// getPerimeter 멤버 함수의 정의
double Circle::getPerimeter() const
{
  const double PI  = 3.14; 
  return (2 * PI * radius);
}
/***************************************************************
 * 애플리케이션                                                *
 * Circle 클래스의 객체를 3개(circle, circle2, circle3) 만들고 * 
 * 멤버 함수 호출                                              *
 ***************************************************************/ 
void test(){
    Circle c1;
}
int main()
{
  // circle3 인스턴스화 후에 멤버 함수 호출
  Circle c2(10.0);
  test();
  cout << "반지름: " << c2.getRadius() << endl;
  Circle circle3; 
  cout << "반지름: " << circle3.getRadius() << endl;
  cout << "넓이: " <<  circle3.getArea() << endl;
  cout << "둘레: " << circle3.getPerimeter() << endl << endl;
  // 소멸자 호출 시점
  return 0;
}