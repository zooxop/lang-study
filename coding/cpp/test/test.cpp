#include <iostream>

using namespace std;

int gcd(int a, int b) {
    int c = a % b;
    while (c != 0) {
        a = b;
        b = c;
        c = a % b;
    }
    return b;
}

int main (){
    cout << "asd" << endl;
    cout << gcd(7, 11) << endl;
    return 0;
}

