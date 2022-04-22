#include <iostream>
using namespace std;

// #pointer-const #더블포인터
int main(){
    int score = 90;
    int b = 1;

    //"const" 키워드의 위치에 따라 작동 가능 범위가 다르다.
    const int* pScore = &score;
    int* const pScore2 = &score;

    //양쪽 다 붙일수도 있다.
    //가리키는 대싱의 값과, 가리키는 대상 자체를 변경하는것 둘 다 안된다.
    const int* const pScore3 = &score;

    //*pScore = 100;  //Error case. pScore가 const라서.
    pScore = &b;  // 이건 된다. 가리키는 대상 자체를 변경하는건 가능하다.
    cout << *pScore << " " << score << endl;

    //pScore2 = &b;  //Error case. 대상 자체를 변경하는건 불가능하다.
    *pScore2 = 100;  //이건 된다. 가리키는 대상의 값은 바꿀 수 있다.
    cout << *pScore2 << " " << score << endl;


    // 더블 포인터 예제
    int* pScore4 = &score;
    int** ppScore4 = &pScore4;

    cout << *pScore4 << " " << ppScore4 << " " << endl;
    cout << &pScore4 << endl;
    cout << pScore4 << " " << &score << " " << *ppScore4 << endl;


    return 0;
}