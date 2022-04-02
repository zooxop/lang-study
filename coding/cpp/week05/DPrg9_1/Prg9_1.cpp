#include <iostream>
using namespace std;

int main() {
    int score = 90;
    cout << &score << endl;
    int& rScore = score;

    /*  Error case. reference 변수는 선언과 동시에 초기화를 해야 한다. 
    int& rScore;
    rScore = score;
    */

    //int& rScore = 99;  // Error case. reference 변수에 직접 정수(실수) 형식을 대입할 수 없다.

    //예외적으로, const 는 직접 숫자를 대입해서 사용할 수 있다.
    const int& rScoreConst = 99; //Read only.

    int a = 100;
    const int& ra = a;
    //ra = 10;  //Error case. 
    a = 9;
    cout << ra << endl;  // 9 출력

    return 0;
}