/**************************************************************
 * Student 클래스의 구현 파일                                 *
 **************************************************************/
#include "student.h"

// 기본 생성자
Student::Student()
: Person(), gpa(0.0) 
{
}
// 매개변수가 있는 생성자  
Student::Student(long id, double gp)
: Person(id), gpa(gp)
{
  assert(gpa >= 0.0 && gpa <= 4.0);
}
// 복사 생성자 
Student::Student(const Student& student)
: Person(student), gpa(student.gpa) 
{
}
// 소멸자
Student::~Student() {
  cout << "자식클래스의 소멸자\n" << this << endl;
}
// 접근자 멤버 함수
void Student::print() const
{
  Person::print();
  cout << "GPA: " << fixed << setprecision(2) << gpa << endl;
}

int Student::getA() const {
  return Person::a;  //부모에서 protected로 선언된 놈들은, 상속받은 클래스 내부에서만 접근 가능하다.
}