#include <iostream>
#include <string>
#include "complex.h"
using namespace std;

Complex operator+(const Complex& left, const Complex& right) {
    int r = left.real + right.real;
    int i = left.imaginary + right.imaginary;

    return Complex(r, i);
}

// #출력 연산자 "<<" 오버로딩.
ostream& operator<<(ostream& out, const Complex& right){
    out << right.Real() << showpos << right.Imaginary() << "i" << noshowpos;
    return out;
}

int main(){
    Complex c1(1, 4);
    Complex c2(99, 7);

    Complex c3(0, 0);
    c3 = (c1 + c2);  // 연산자 오버로딩을 통한 객체 리턴
    // c3 = c1.operator+(c2);  // 위 코드랑 같은거임
    c3 = c1++;
    cout << c3.Imaginary() << " " << c3.Real() <<  endl;
    cout << c1.Imaginary() << " " << c1.Real() <<  endl;

    //cout << c1.Imaginary(7) << endl;

    ++c2;  // ++ 연산자 오버로딩.
    c2++;
    cout << c2.Imaginary() << " " << c2.Real() <<  endl;
    
    cout << c3 << endl;

    return 0;
}