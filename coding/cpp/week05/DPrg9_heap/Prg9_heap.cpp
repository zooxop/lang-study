#include <iostream>
using namespace std;

int main() {
    int n;
    int sum=0;

    cout << "몇 분이세요? ";
    cin >> n;

    int* pn = new int[n];

    for(int i=0; i < n; i++){
        //cin >> pn[i];
        cin >> *(pn + i);
    }

    for(int i=0; i < n; i++){
        sum += pn[i];
    }

    cout << sum << endl;

    delete[] pn;  //Heap메모리 공간 해제
    pn = nullptr;  //포인터 변수 주소 삭제(초기화).

    return 0;
}