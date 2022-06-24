## 연산자 오버로딩

```cpp
// #출력 연산자 "<<" 오버로딩.
ostream& operator<<(ostream& out, const Final& right){
    out << right.getFirst() << "/" << right.getSecond();
    return out;
}

istream& operator>>(istream& in, Final& right){
    int first, second = 0;

    cout << "fisrt : ";
    in >> first;
    right.setFirst(first);

    cout << "second : ";
    in >> second;
    right.isAvailable();
    right.setSecond(second);
    right.setGcd();
    return in;
}
```

```cpp
Complex operator++() {  // 전위 연산
    this->real++;
    return *this;
}

Complex operator++(int) {  // 후위 연산
    Complex prev(this->real, this->imaginary);
    this->real++;
    return prev;
}
```

```cpp
// '+' 연산자 오버로딩을 통해 객체 리턴.
Complex operator+(const Complex& left, const Complex& right) {
    int r = left.real + right.real;
    int i = left.imaginary + right.imaginary;

    return Complex(r, i);
}

// Complex의 구현파일(혹은 헤더파일)이 아니라 main.cpp 파일에서 사용하려면,
// Complex 클래스에 friend로 선언을 해줘야 함. (private, protected 멤버에 접근 가능하도록.)
class Complex {
    friend Complex operator+(const Complex& left, const Complex& right);

    private:
        int real;
        int imaginary;
    public:
        ...
        ...
```

---

## vector, sort 사용법
vector with iterator 사용법
```cpp
#include <vector>
#include <iterator>
#include <iostream>

using namespace std;

int main() {
    vector<int> vec(10);
    vector<int>::iterator iter;
    vector<int>::reverse_iterator rIter;

    for (int i=0; i < 10; i++){
        vec.at(i) = i * i;
    }

    cout << "기본 탐색: ";
    for (auto v : vec){
        cout << " " << v;
    }
    cout << endl;

    cout << "기본 탐색: ";
    for (auto iter = vec.begin(); iter != vec.end(); ++iter){
        cout << " " << *iter;
    }
    cout << endl;

    cout << "역 탐색: ";
    for (auto rIter = vec.rbegin(); iter != vec.end(); ++rIter){
        cout << " " << *rIter;
    }
    cout << endl;

    return 0;
}
```

sort() 사용법
```cpp
#include <algorithm>

vector<Test> vector = { a1, a2, a3, a4, a5, a6 };

sort(vector.begin(), vector.end(),[](Test i, Test j){
    if (i.getFirst() != j.getFirst()){
        return i.getFirst() > j.getFirst();
    } else {
        return i.getSecond() > j.getSecond();
    }
});

for (auto v : vector)
    cout << v << endl;
```

---

## 관계 관련 용어

- is-a : 상속
- is related to : 연관
  - 소유(집합) : has-a / aggregation
  - 구성 : composition
- use-a : 종속(의존)
  - 상속이나 연관 관계보다는 약한 결합관계이다.
  - 클래스 A의 멤버 함수에서 클래스 B를 매개변수/리턴값/지역 변수로 사용한다면, A가 B를 의존하는 것.

---

## try ~ catch 사용법
단순한 방법
```cpp
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
      if(num2 == 0)
      {
        throw 0;      // int 자료형의 예외를 발생
      }
      result = num1 /num2;
      cout << "결과 = " << result << endl;
    }
    catch(int x)
    {
      cout << "0으로 나눌 수 없습니다." << endl;
    }
  }  
  return 0;
}
```

myexception.h
```cpp
#pragma once
class MyException {
    public:
        const void* sender;  // 예외를 던진 객체의 주소
        const char* description;  // 예외에 대한 설명
        int code;

        MyException(const void* sender,
                    const char* description,
                    int code){

            this->sender = sender;
            this->description = description;
            this->code = code;
        };
        
};
```

구현 파일
```cpp
#include <iostream>
#include "myexeption.h"
using namespace std;

class DynamicArray {
    private:
        int* arr;
        int size;
    public:
        DynamicArray(int arraySize){
            try {
                arr = new int[arraySize];
                size = arraySize;
                throw MyException(this, "생성자 내부에서 예외 발생.", 2000);
            }
            catch(...) {
                cout << "생성자 안쪽 예외처리중.." << endl;
                delete[] arr;
                arr = nullptr;
                throw;
            }
        };

        ~DynamicArray() {
            delete[] arr;
            arr = nullptr;
            cout << this << " : 메모리 제거완료" << endl;
        };

        void setAt(int index, int value) {
            if (index < 0 || index >= getSize()){
                throw MyException(this, "인덱스의 범위를 벗어났습니다. 값을 할당할 수 없습니다.", 1001);
            }
            arr[index] = value;
        };

        int getAt(int index) const {
            if (index < 0 || index >= getSize()){
                // throw 0;
                throw MyException(this, "인덱스의 범위를 벗어났습니다.", 1000);
            }
            return arr[index];
        };

        int getSize() const {
            return size;
        };
};

int main() {
    try {
        DynamicArray a(5);  
        a.setAt(0, 100);
        cout << a.getAt(0) << endl;
        cout << a.getSize() << endl;
        cout << a.getAt(5) << endl;
    }
    catch (int ex){
        cout << ex << " 예외발생!" << endl;
    }
    catch (MyException& ex) {
        cout << "예외코드 : " << ex.code << endl;
        cout << "예외종류 : " << ex.description << endl;
    }
    return 0;
};
```

---

## template 사용법

``` cpp
#pragma once

template <typename T>
class Stime{
private:
    //Sample* Sample;
    T Sample;

public:
//    Stime(Sample* Sample){
//        this->Sample = Sample;
//    };
    Stime(T Sample): Sample(Sample) {

    }

    ~Stime(){
        delete Sample;
        Sample = nullptr;
    }

    void print() const{
        cout << Sample->getFirst() << "," << Sample->getSecond() << endl;
    }

    int gcd(int a, int b) const{
        int c = a % b;
        while (c != 0) {
            a = b;
            b = c;
            c = a % b;
        }
        return b;
    }
};
```

---

## 다형성

```cpp
/*************************************************************
 * 다형성의 3가지 재료를 활용해 다형성을 살펴보는 프로그램   *
 *************************************************************/

// #virtual 
#include <iostream>
#include <string>
using namespace std;
// 베이스 클래스의 정의
class Base
{
  public:
  virtual void print() const { cout << "베이스 클래스" << endl; }
};
// 파생 클래스의 정의
class Derived : public Base       
{
  public:
  virtual void print() const { cout << "파생 클래스" << endl; }
};
int main()
{
  // 베이스 클래스에 대한 포인터(소켓) 생성
  Base* ptr;
  // ptr 포인터로 베이스 클래스의 객체 가리키기
  ptr = new Base();
  ptr -> print();   
  delete ptr; 
  // ptr 포인터로 파생 클래스의 객체 가리키기  
  ptr = new Derived();
  ptr -> print();
  delete ptr;   
  return 0;
}
```
출력결과 : 
베이스 클래스
파생 클래스

- 이는 "virtual" 키워드를 사용하였기 때문에 가능한것.
- print() 라는 이름의 함수를 만들고 virtual 키워드를 붙이면, 객체별로 다른 것을 실행시킬 수 있다.
- virtual 키워드는 Base 클래스에만 붙여주면, 파생 클래스들은 생략할 수 있음.