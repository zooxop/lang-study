#include <iostream>
using namespace std;

int main() {
    int m[3][2] = { {3,4}, {1,2}, {5,6} };
    int* pm = &m[0][0];  //int* pm = m;

    // 포인터와 1중 for문을 활용한 2차원 배열 요소 출력
    for(int k=0; k < 6; k++){
        //cout << *(pm + k) << endl;
        cout << pm[k] << " " << &pm[k] << endl;
    }

    // 2중 for문을 활용한 2차원 배열 요소 출력
    for(int i=0; i < 3; i++){
        for(int j=0; j < 2; j++){
            cout << m[i][j] << endl;
        }
    }

    return 0;
}