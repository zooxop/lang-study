#include <iostream>
#include <string>
using namespace std;

class Complex {
    private:
        int real;
        int imaginary;
    public:
        Complex(int realPart, int imaginaryPart) : real(realPart), imaginary(imaginaryPart){
            
        }
        //~Complex();

        int Real(int realPart){
            real = realPart;
            return real;
        }

        int Imaginary(int imaginaryPart){
            imaginary = imaginaryPart;
            return imaginary;
        }

        int Real() const {
            return real;
        }

        int Imaginary() {
            return imaginary;
        }

        // 연산자 오버로딩
        Complex operator+ (const Complex& right){
            int r = this->real + right.real;
            int i = this->imaginary + right.imaginary;
            return Complex(r, i);
        }
};

int main(){
    Complex c1(1, 4);
    Complex c2(99, 7);

    Complex c3(0, 0);
    c3 = (c1 + c2);  // 연산자 오버로딩을 통한 객체 리턴
    // c3 = c1.operator+(c2);  // 위 코드랑 같은거임

    cout << c3.Imaginary() << " " << c3.Real() <<  endl;

    //cout << c1.Imaginary(7) << endl;

    return 0;
}