// 소수 구하기 예제
#include <iostream>
using namespace std;

bool isPrime(int);  //프로토타입. 소수면 true 리턴.

int main(){
    int n1, n2;

    cout << "시작 숫자를 입력하세요 : ";
    cin >> n1;

    cout << "끝 숫자를 입력하세요 : ";
    cin >> n2;

    for(int j=n1; j < n2; j++){
        if (isPrime(j)){
            cout << j << " " << endl;
        }
    }

    return 0;
}

bool isPrime(int n){
    for(int i=2; i < n; i++){
        if(n % i == 0){
            return false;
        }
    }
    return true;
}



// #include <iostream>
// using namespace std;

// int main(){
//     int n = 0;
//     bool isPrime = true;

//     cout << "숫자를 입력하세요 : ";
//     cin >> n;

//     for(int i=2; i < n; i++){
//         if(n % i == 0){
//             isPrime = false;
//             break;
//         }
//     }

//     if(isPrime){
//         cout << "입력된 수 " << n << "은 소수입니다." << endl;
//     } else {
//         cout << "입력된 수 " << n << "은 소수가 아닙니다." << endl;
//     }

//     return 0;
// }