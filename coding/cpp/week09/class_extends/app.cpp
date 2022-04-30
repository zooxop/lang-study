/**************************************************************
 * Person 클래스와 Student 클래스를 사용하는 애플리케이션     *
 **************************************************************/
#include "student.h"

int main() {
  // Person 객체 인스턴스화하고 사용
  Person person(111111111);
  cout << "Person 객체의 정보: " << endl;
  person.print();
  cout << endl;
  // Student 객체 인스턴스화하고 사용
  Student student(222222222, 3.9);
  cout << "Student 객체의 정보: " << endl;
  student.print();
  cout << endl;
  return 0;
}

/*
  자식 클래스는 생성될 때, 부모 클래스를 함께 생성한다. (부모가 먼저 생성됨)
  따라서, 자식 클래스가 소멸될때도 마찬가지로 부모 클래스의 소멸자를 함께 호출해준다.
*/