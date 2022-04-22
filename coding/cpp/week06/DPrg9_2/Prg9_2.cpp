#include <iostream>
using namespace std;
// #정적할당 #동적할당
class Circle
{
  private: 
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

// 매개변수 생성자의 정의
Circle::Circle(double rds)
: radius(rds)
{
  cout << "매개변수가 있는 생성자가 호출되었습니다." << endl;
}
// 기본 생성자의 정의
Circle::Circle()
: radius(0.0)
{
  cout << "기본 생성자가 호출되었습니다." << endl;
}
// 복사 생성자의 정의
Circle::Circle(const Circle& circle)
: radius(circle.radius)
{
  cout << "복사 생성자가 호출되었습니다." << endl;
}
// 소멸자의 정의
Circle::~Circle()
{
  cout << this << "소멸자가 호출되었습니다." << radius;
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

Circle* test() {  // 동적할당!!!!!
    int c6;
    Circle* c4 = new Circle(100); //동적할당 하는거임
    Circle* c5 = new Circle(7.7); //동적할당은 Heap에 쌓인다.
    cout << c4 << endl;
    cout << c5 << endl;
    cout << &c6 << endl;
    delete c4;  //이렇게 함수 안에서 할당된 클래스는, 함수 안에서 delete를 해줘야 소멸자가 호출됨. 안해주면 main()이 끝나도 안됨.
    c4 = nullptr;
    return c5;
}

// 리턴 타입이 포인터가 아니라면, new를 쓰면 안된다. (정적할당)
Circle test22() {
    Circle c5(30);  //이것이 바로 정적할당. 정적할당은 Stack에 쌓인다.
    return c5;
}

int j = 11;
int k = 11;

// #클래스포인터 #클래스소멸자 #소멸자
int main()
{
    
    Circle circle1(5.2);
    cout << "반지름: " << circle1.getRadius() << endl;
    cout << "넓이: " << circle1.getArea() << endl;
    cout << "둘레: " << circle1.getPerimeter() << endl << endl;

    Circle circle2(circle1); 
    cout << "반지름: " << circle2.getRadius() << endl;
    cout << "넓이: " <<  circle2.getArea() << endl;
    cout << "둘레: " << circle2.getPerimeter() << endl << endl;

    //Circle* c5 = test();
    Circle* cTest = test();
    Circle cTest2 = test22();
    cout << "여기여기 : " << cTest2.getRadius() << endl;

    Circle circle3; 
    cout << "반지름: " << circle3.getRadius() << endl;
    cout << "넓이: " <<  circle3.getArea() << endl;
    cout << "둘레: " << circle3.getPerimeter() << endl << endl;

    delete cTest;
    cTest = nullptr;

    // 소멸자 호출 시점
    // 소멸자는 Stack이므로, circle3부터 작동한다.

    // 메모리 번지 동네가 main() / test() / 전역 각각 다르다는걸 확인해보기 위해.
    cout << &circle1 << endl;
    cout << &circle2 << endl;
    cout << &circle3 << endl;

    cout << &j << endl;
    cout << &k << endl;
    return 0;
}