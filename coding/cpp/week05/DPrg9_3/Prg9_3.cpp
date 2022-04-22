#include <iostream>
using namespace std;
// #delete #메모리해제
int* test() {
    int b = 10;
    int* pa = new int;  //동적할당 (Heap 메모리)
    *pa = 8;
    cout << b << " " << *pa << endl;

    return pa;
}

int main() {
    int a = 5;
    int* pm;
    pm = test();

    cout << a << " " << *pm << endl;

    delete pm;  //동적 할당된 Heap 메모리의 영역을 해제한다.
    // delete a;  //에러 발생. new로 선언한 변수가 아니라서..
    //pm = 0;
    //pm = NULL;
    pm = nullptr;  //모던 C++에서는 nullptr 키워드를 사용한다.

    return 0;
}

// test() 에서 동적할당한 pa 변수의 주소는, test() 함수가 끝나도 할당이 해제되지 않는다.
// 따라서, "delete"를 해주지 않으면 메모리 누수가 생긴다.
//  - 가비지 콜렉터의 제거 대상이 되긴 하나, 프로그램의 동작 시간을 느리게 만들 수 있다.

// "new" 로 동적할당을 한 변수만 delete를 사용할 수 있다.
// 선언만 하고 할당을 하지 않은 포인터 변수를 delete하면, 런타임 에러 "pointer being freed was not allocated"가 발생한다.