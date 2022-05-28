#include <iostream>
#include <new>

using namespace std;

int main() {
    try {
        char* p = new char[0x0ffffffffff];
    }
    catch (bad_alloc& ex) {
        cout << ex.what() << endl;
    }
    return 0;
}