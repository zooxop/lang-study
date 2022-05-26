#include <iostream>
using namespace std;
// #거듭제곱
int main() {
    auto power = [](int base, int e) -> int {
        int r = 1;
        for(auto i = 1; i <= e; i++){
            r = r * base;
        }
        return r;
    };

    cout << power(3, 3) << endl;

    return 0;
}