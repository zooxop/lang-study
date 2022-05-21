#ifndef COMPLEX_H
#define COMPLEX_H
class Complex {
    // #friend #프렌드
    friend Complex operator+(const Complex& left, const Complex& right);

    private:
        int real;
        int imaginary;
    public:
        Complex(int realPart, int imaginaryPart) : real(realPart), imaginary(imaginaryPart){
            
        }

        Complex operator++() {  // 전위 연산
            this->real++;
            return *this;
        }

        Complex operator++(int) {  // 후위 연산
            Complex prev(this->real, this->imaginary);
            this->real++;
            return prev;
        }
        

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

        int Imaginary() const {
            return imaginary;
        }

};
#endif