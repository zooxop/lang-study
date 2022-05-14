// #다중상속

#include <iostream>
#include <string>
using namespace std;

class UnderGradStudent {
    public:
        string name;  // 이름
        string dept;  // 학과

        //학사 경고
        void warn(){

        }
};

class DormStudent {
    public:
        string building;  // 기숙사
        int roomNumber;  // 방 번호

        //벌점 부여
        void warn(){
            
        }
};

class UnderGrad_DormStudent : public UnderGradStudent, public DormStudent {
    public:
        void sleep() {

        }
};

int main() {
    UnderGrad_DormStudent s1;
    s1.name = "Mun Cheol-hyun";
    s1.dept = "Software Conv Eng";
    s1.building = "1 기숙사";
    s1.roomNumber = 238;

    s1.sleep();
    // s1.warn();  //Error. 어느 부모클래스의 warn() 인지 모호함.
    s1.UnderGradStudent::warn();  // 다중 상속 문제 해결. scope 연산자.
    s1.DormStudent::warn();

    return 0;
}