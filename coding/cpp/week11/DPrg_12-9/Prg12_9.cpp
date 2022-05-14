/**************************************************************
 * typeid 연산자로 클래스 이름을 확인하는 프로그램            *
 **************************************************************/
#include <iostream>
#include <string>
#include <typeinfo> 
using namespace std;

class Animal {
    public:
        virtual void sleep() = 0;  // 순수 가상함수
        virtual void print() {

        }
};

class Horse : public Animal{
    public:
        void print(){
            cout << "말\n" << endl;
        }
};

int main()
{
    Animal a;
    Horse h;

    
    
    /*
    Animal* ptr1 = new Animal();// new Horse();  // upcast
    cout << hex << ptr1 << endl;

    // Horse* ptr2 = static_cast<Horse*>(ptr1);
    Horse* ptr2 = dynamic_cast<Horse*>(ptr1);  // dynamic_cast를 하면, 상속관계가 아니여서 casting이 실패한 경우 주소가 아니라 null을 받는다.
    cout << hex << ptr2 << endl;

    ptr1->print();
    ptr2->print();

    delete ptr1;
    //delete ptr2;

//    cout << typeid(a).name() << endl;
//    cout << typeid(h).name();

    */
    return 0;
}