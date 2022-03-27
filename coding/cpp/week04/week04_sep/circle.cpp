#include "circle.h"

Circle::Circle(double rds)
{
    if(rds <= 0.0){
        cout << "반지름은 0보다 작을 수 없습니다." << endl;
        assert(false);
    } else {
        radius = rds;
        cout << "매개변수가 있는 생성자가 호출되었습니다." << endl;
    }
}
// 기본 생성자의 정의
Circle::Circle()
: radius(0.0)
{
  cout << "기본 생성자가 호출되었습니다." << endl;
}
// 복사 생성자의 정의
Circle::Circle(const Circle& circle)
: radius(circle.radius)  //기본값 설정
{
  cout << "복사 생성자가 호출되었습니다." << endl;
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