#include "student.h"
#include <vector>
#include <fstream>

void printTemplate(){
    cout << "---------- 메뉴 ----------" << endl;
    cout << "1. 학생 성적 추가" << endl;
    cout << "2. 전체 성적 보기" << endl;
    cout << "3. 전체 성적 저장하기(텍스트)" << endl;
    cout << "Q. 프로그램 종료" << endl;
    cout << "-------------------------" << endl << endl;
    cout << "원하는 작업의 번호를 입력하세요 : ";
}

int main() {

    char input = '0';
    int studentCount = 0;
    vector<Student*> vec;

    do {
        printTemplate();
        cin >> input;

        if (input == '1'){
            cout << "이름(공백없이) 국어, 영어, 수학 점수를 입력하세요 : " << endl;
            string name;
            int kor, eng, math = -1;

            cin >> name >> kor >> eng >> math;

            if ((kor < 0 || kor > 100) || (eng < 0 || eng > 100) || (math < 0 || math > 100)) {
                cout << "성적은 0점부터 100점 사이의 값을 입력해주시기 바랍니다." << endl;
            } else {
                cout << "학생 성적이 올바르게 입력되었습니다." << endl;

                Student* temp = new Student(++studentCount, name, kor, eng, math);
                vec.push_back(temp);
            }
        } else if (input == '2') {
            double total = 0;

            cout << "\t\t <전체 성적 보기>" << endl;
            cout << "\t학번" << "\t이름" << "\t국어" << "\t영어" << "\t수학" << "\t평균" << endl;
            for (auto v : vec){
                cout << "\t" << v->getNumber() << "\t" << v->getName() << "\t"
                     << v->getKor() << "\t" << v->getEng() << "\t"
                     << v->getMath() << "\t" << v->getAvg() << endl;
                total += v->getAvg();
            }
            cout << endl;
            cout << "전체 평균 = " << (total / studentCount) << endl;

        } else if (input == '3') {
            double total = 0;

            ofstream outStrm;
            outStrm.open("report");
            if(!outStrm.is_open()) {
                cout << "report 파일을 열 수 없습니다.";
                assert(false);
            }

            outStrm << "\t\t <전체 성적 보기>" << endl;
            outStrm << "\t학번" << "\t이름" << "\t국어" << "\t영어" << "\t수학" << "\t평균" << endl;
            for (auto v : vec){
                outStrm << "\t" << v->getNumber() << "\t" << v->getName() << "\t"
                     << v->getKor() << "\t" << v->getEng() << "\t"
                     << v->getMath() << "\t" << v->getAvg() << endl;
                total += v->getAvg();
            }
            outStrm << endl;
            outStrm << "전체 평균 = " << (total / studentCount) << endl;

            // 파일 닫기
            outStrm.close();
            // return 이후에 ofstream 객체가 소멸

        }
    } while(input != 'Q');

    return 0;
}