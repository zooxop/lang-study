#include <iostream>
using namespace std;

int main() {
    int a = 10;  // 일반 변수
    int* pa = &a;  // 포인터
    int& ra = a;  // 참조 타입

    cout << &a << " " << a << endl;  // 주소 10
    cout << pa << " " << *pa << endl;  // 주소 10
    cout << &ra << " " << ra << endl;
    cout << &pa << endl;  // 주소
    cout << (&a + 1) << endl;  // 주소 + 4바이트

    *pa = 20;

    cout << a << " " << *pa << endl;  //20 20 

    ra = 30;

    cout << a << " " << *pa << " " << ra << endl;

    return 0;
}