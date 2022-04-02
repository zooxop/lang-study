#include <iostream>
using namespace std;

int main(){
    int score = 90;
    
    //int* pScore = &score;
    //reference 타입과는 다르게, 선언과 동시에 초기화를 할 필요는 없다.
    int* pScore; 
    pScore = &score;

    bool* pb;
    short* ps;
    int* pi;
    long* pl;

    cout << *pScore << " " << score << endl;
    cout << pScore << " " << &score << endl;
    cout << &pScore << " " << sizeof(pScore) << endl;

    //데이터 타입의 size는 작업 환경(프로세서)에 따라 다르다.
    cout << sizeof(long) << endl;

    cout << sizeof(*pb) << endl;
    cout << sizeof(*ps) << endl;
    cout << sizeof(*pi) << endl;
    cout << sizeof(*pl) << endl;

    return 0;
}