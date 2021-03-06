#include <iostream>
#include <string>
#include <array>

using namespace std;

void printTemplete();

class Soldier {
    private:
        string name;
        int grade; // 1:이등병, 2:일병, 3:상병, 4:병장
        string hobby;
    
    public:
        Soldier();
        Soldier(const string& name, int grade, const string& hobby);
        Soldier(const Soldier& std);
        ~Soldier();

    string getName() const {
        return name;
    }

    int getGrade() const {
        return grade;
    }

    string getHobby() const {
        return hobby;
    }



    static int soldier_count;
    static void PrintSoldierCount();
};
int Soldier::soldier_count = 0;
void Soldier::PrintSoldierCount(){
    cout << "2중대 인원 : " << soldier_count << endl;
}
Soldier::Soldier(const string& name, int grade, const string& hobby){
    this->name = name;
    this->grade = grade;
    this->hobby = hobby;
    Soldier::soldier_count++;
    cout << name << "님의 입대를 환영합니다." << endl;
}

Soldier::Soldier() {
    name = "";
    grade = 0;
    hobby = "";
}

Soldier::Soldier(const Soldier& std){
    cout << " " << endl;
}
Soldier::~Soldier() {
    cout << " " << endl;
}

int main() {
    int menu = 0;
    
    Soldier* soldiers[] = {
        new Soldier("성윤모", 1, "롤리폴리"),
        new Soldier("차병호", 1, "축구"),
        new Soldier("박민석", 2, "복싱"),
        new Soldier("임다혜", 2, "뺑끼치기"),
        new Soldier("김상훈", 3, "무에타이"),
        new Soldier("최일구", 4, "격투기 시청")
    };

    // Soldier* soldiers = new Soldier[]{
    //         Soldier("성윤모", 1, "롤리폴리"),
    //         Soldier("차병호", 1, "축구"),
    //         Soldier("박민석", 2, "복싱"),
    //         Soldier("임다혜", 2, "뺑끼치기"),
    //         Soldier("김상훈", 3, "무에타이"),
    //         Soldier("최일구", 4, "격투기 시청")
    // };

    do {
        printTemplete();
        cin >> menu;

        switch (menu) {
        case 1:
            cout << "현재 총 인원 : " << Soldier::soldier_count << endl;
            Soldier::PrintSoldierCount();
            break;
        case 2:
            cout << "you input 2." << endl;
            break;
        case 0:
            cout << "종료." << endl;
            break;
        default:
            cout << "그런건 없다." << endl;
            break;
        }
    } while(menu != 0);


    return 0;
}

void printTemplete(){
    cout << "기능을 선택하세요. (종료 : 0)" << endl;
    cout << "1 : 전체 인원수 출력" << endl;
    cout << "2 : 뭐임마 " << endl;
    cout << "입력 : ";
}


// 포인터, 정적할당, 동적할당, String(문자열) 사용법이 중요하다. (중간고사)