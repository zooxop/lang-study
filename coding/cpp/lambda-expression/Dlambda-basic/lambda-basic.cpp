#include <iostream>
using namespace std;

int main() {
    // Lambda Expression  (C++11, 14)
    // [캡쳐블럭](매개변수리스트)->리턴타입{함수바디};

    // []()->void {};  // 기본 형태
    // []() {};  // 리턴 타입은 생략 가능하다. 
    // [] {};  // 매개변수 리스트도 생략 가능하다.

    // 맨 끝에 "()"를 달면, 해당 람다 표현식을 즉시 실행한다.
    []{cout << "Hi Lambda!" << endl;}();

    ////////////////////////
    // 람다 함수의 주소를 변수에 할당해서 실행하는 방법.
    auto inha = []{cout << "Hi Lambda!" << endl;};
    inha();

    auto inha2 = []() { return 5 + 10; };
    cout << inha2() << endl;

    auto inha3 = [](int a, int b) { return a + b; };
    cout << inha3(10, 20) << endl;

    auto inha4 = [](int a, int b) -> int { return a + b; };
    cout << inha4(10, 20) << endl;

    auto inha5 = [](int a, int b) -> int { return a + b; }(5, 10);
    cout << inha5 << endl;

    auto inha6 = [](float a, int b) -> float { return a + b; };
    cout << inha6(7.7f, 2) << endl;
    ////////////////////////

    ////////////////////////
    // [캡쳐블럭] : 람다함수 외부의 변수를 참조할 수 있게 해준다.

    short c = 5, d = 7;
    auto test = [c, d](float a, int b) {
        // c = -11;  // Error case. 식이 수정할 수 있는 lvalue여야 한다.
        return a + b + c + d;
    };
    cout << test(1.9f, 2) << endl;

    // 캡쳐블록의 변수 값을 변경해서 사용하고 싶으면, & 기호를 사용한다.
    auto test2 = [&c, d](float a, int b) -> int {
        c = -5;
        return a + b + c + d;
    };
    cout << test2(1.9f, 2) << endl;
    cout << c << endl;  //원본 변수의 값도 변경된다. 

    // 아래처럼 & 기호만 입력하는 것으로 생략할 수 있음.
    auto test3 = [&](float a, int b) -> int {
        c = -5;
        d = 8;
        return a + b + c + d;
    };
    cout << test3(1.9f, 2) << endl;

    // = 기호는 [c, d] 를 적은 것과 동일하게 동작한다.
    auto test4 = [=](float a, int b) -> int {
        // c = -5;  //불가능.
        // d = 8;
        return a + b + c + d;
    };
    cout << test4(1.9f, 2) << endl;


    return 0;
}