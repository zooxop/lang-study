#include <iostream>
using namespace std;

int main()
{
    int a = 10;
    int* pa = &a;
    cout << &a << " " << a << endl;
    cout << pa << " " << *pa << endl;
    cout << &pa << endl;
    cout << (&a + 1) << endl;
    return 0;
}