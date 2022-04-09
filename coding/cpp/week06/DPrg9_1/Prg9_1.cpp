#include <iostream>
using namespace std;

int main(){
    // 2중 포인터
    int** p = nullptr;
    p = new int* [5];

    for(int i=0; i < 5; i++){
        p[i] = new int[5];
    }

    int k = 0;

    for(int i=0; i < 5; i++){
        for(int j=0; j < 5; j++){
            p[i][j] = ++k;
        }
    }
    
    //출력
    for(int i=0; i < 5; i++){
        for(int j=0; j < 5; j++){
            cout << p[i][j] << " ";
        }
        cout << endl;
    } //p[1][1] = 7;
    
    int* sp = p[4];
    cout << sp[2] << endl;  //출력 : 23
    cout << *(sp+3) << endl;  //출력 : 24

    //메모리 해제
    for(int i=0; i < 5; i++){
        delete p[i];
    }
    delete[] p;
    p = nullptr;

    return 0;
}