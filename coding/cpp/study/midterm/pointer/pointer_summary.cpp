#include <iostream>
using namespace std;

//매개변로 레퍼런스를 쓰는 이유 : 레퍼런스는 메모리 공간을 공유하기 때문에, 추가 메모리 공간을 소모하지 않는다.
void refTest(int& ref) {
    ref = 5;
    cout << "in refTest : " << ref << endl;
}


int main() {
    int a = 10;  // 일반 변수
    int* pa = &a;  // 포인터
    int& ra = a;  // 참조 타입(레퍼런스). 선언과 동시에 초기화를 해야 함.
    const int& cra = a;  //const 사용 시, cra 변수를 통해서 값을 변경할 수 없다. => cra = 1000; //컴파일 에러
    

    cout << &a << " " << a << endl;  // 주소 10
    cout << pa << " " << *pa << endl;  // 주소 10
    cout << &ra << " " << ra << endl;
    cout << &pa << endl;  // 주소
    cout << (&a + 1) << endl;  // 주소 + 4바이트

    *pa = 20;

    cout << a << " " << *pa << endl;  //20 20 

    ra = 30;

    cout << a << " " << *pa << " " << ra << endl;

    refTest(a);
    cout << "after refTest : " << a << endl; 


    //"const" 키워드의 위치에 따라 작동 가능 범위가 다르다.
    int score = 90;
    int b = 1;
    
    const int* pScore = &score;  //주소값 바꾸는것만 가능 => pScore = &b;
    int* const pScore2 = &score;  // 가리키는 값의 value를 바꾸는것만 가능 =>  *pScore2 = 100;

    *pScore2 = 100;
    cout << score << endl;

    //더블포인터 : 포인터를 가리키는 포인터. 포인터변수 자체를 보관해야 할 때 사용??
    int* pScore4 = &score;
    int** ppScore4 = &pScore4;

    cout << *pScore4 << " " << ppScore4 << " " << endl;
    cout << &pScore4 << endl;
    cout << pScore4 << " " << &score << " " << *ppScore4 << endl;

    //delete pScore;  //런타임 에러가 발생한다. pScore 변수는 "new" 를 통한 동적할당을 진행한 변수가 아니기 때문에.
    

    return 0;
}