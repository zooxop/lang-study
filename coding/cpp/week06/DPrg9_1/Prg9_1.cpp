#include <iostream>
using namespace std;
// #2중포인터 #이중포인터 #메모리해제(2중포인터)
int main(){
    // 2중 포인터
    // 4x5 2차원 배열을 선언한 거시다.
    int** p = nullptr;
    p = new int* [4];  //열(세로)

    for(int i=0; i < 4; i++){
        *(p + i) = new int[5]; //행(가로)
        //p[i] = new int[5];  //이것도 됨.
    }

    int k = 0;

    for(int i=0; i < 4; i++){
        for(int j=0; j < 5; j++){
            //p[i][j] = ++k;  //이것도 됨.
            *(p[i] + j) = ++k;
        }
    }
    /* 이거 하는거임.
    1 2 3 4 5 
    6 7 8 9 10 
    11 12 13 14 15 
    16 17 18 19 20 
    */
    
    //출력
    for(int i=0; i < 4; i++){
        for(int j=0; j < 5; j++){
            cout << p[i][j] << " ";
        }
        cout << endl;
    } //p[1][1] = 7;
    
    int* sp = p[3];
    cout << sp[2] << endl;  //출력 : 18
    cout << *(sp+3) << endl;  //출력 : 19

    //메모리 해제
    for(int i=0; i < 4; i++){
        delete p[i];
    }
    delete[] p;
    p = nullptr;

    return 0;
}