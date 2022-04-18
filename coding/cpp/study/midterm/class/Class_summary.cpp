#include <iostream>
using namespace std;

class Circle {
    private:
        const double PI = 3.14;
        double radius;
    public:
        Circle(double radius);  //매개변수 있는 생성자
        Circle();  //기본생성자
        ~Circle(); //소멸자 
        Circle(const Circle& circle);  //복사 생성자 //const를 붙이는 이유 : 원본 객체를 변경하지 못하게 하려고.
        double getRadius();
        double getArea();
        double getPerimeter();  //둘레
        void setRadius(double value);
};

Circle::Circle() : radius(0.0) {
    cout << "기본생성자 호출" << endl;
}

Circle::Circle(double radius) : radius(radius){
    cout << "매개변수 있는 생성자 호출" << endl;
}

Circle::~Circle(){
    cout << "소멸자 호출" << radius << endl;
}

Circle::Circle(const Circle& circle) : radius(circle.radius){
    cout << "복사 생성자 호출" << endl;
    // 인스턴스를 완전 새로 생성하는것이므로, 원본 인스턴스에 영향을 주지 않는다.
}

double Circle::getRadius(){
    return this->radius;
}

double Circle::getArea(){
    return (PI * radius * radius);
}

double Circle::getPerimeter(){
    return (2 * PI * radius);
}

void Circle::setRadius(double value){
    this->radius = value;
}

void destructorTest() {
    Circle c1;
    // 이 함수를 빠져나가면서 소멸자가 호출된다.(지역변수)
}

class RandomInteger {  //주어진 범위의 랜덤한 숫자를 생성하는 클래스 #랜덤
    private:
        int low;
        int high;
        int value;
    public :
        RandomInteger();
        RandomInteger(int low, int high);
        ~RandomInteger();
        // 합성 복사 생성자 사용을 못하도록.
        RandomInteger(const RandomInteger& random) = delete;
        void print() const;  //const 키워드가 붙어있으므로, print() 안에서 멤버 변수 값을 변경하는 코딩을 할 수 없음.
};

RandomInteger::RandomInteger(){

}

RandomInteger::RandomInteger(int low, int high) : low(low), high(high){
    srand(time(0)); 
    int temp = rand();
    value = temp % (high - low + 1) + low;
}

RandomInteger::~RandomInteger(){
    //소멸자
}

void RandomInteger::print() const {
    cout << value << endl;
}


int main(){
    cout << "Circle 1" << endl;
    Circle circle1;  //기본 생성자 예시
    circle1.setRadius(10.0);

    destructorTest();  //지역변수 예시

    Circle circle2(5.0);  //매개변수 있는 생성자 예시

    cout << "반지름 : " << circle1.getRadius() << endl;

    Circle circle3(circle2);  // 복사 생성자 예시
    cout << "(복사) 반지름 : " << circle3.getRadius() << endl;
    circle3.setRadius(10.0);

    cout << "반지름(복사 후 원본 변경) : " << circle2.getRadius() << endl;
    cout << "반지름(복사 및 변경 후 복사본) : " << circle3.getRadius() << endl;

    RandomInteger r1(100, 200);
    cout << "100~200 사이의 랜덤한 숫자 :";
    r1.print();

    // #클래스배열 #클래스동적할당
    /*RandomInteger* randomIntegers = new RandomInteger[]{ 
        RandomInteger(10, 20),  // 이 방식은 "복사생성자"를 delete 해놓으면 작동하지 않는다.
        RandomInteger(30, 40),  // 왜인지는 잘..
        RandomInteger(100, 200)
    };*/
    // 가급적이면 이 방식으로 하자.
    RandomInteger* randomIntegers[] = {
        new RandomInteger(10, 20),
        new RandomInteger(30, 40)
    };

    return 0;
    // 소멸자 호출은 선언의 역순으로 실행된다.(Last In First Out)
}