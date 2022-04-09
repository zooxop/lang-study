/**************************************************************
 * C 문자열을 만들고,                                         *
 * 입출력 연산자를 사용하는 프로그램                          *
 **************************************************************/
#include <iostream>
using namespace std;

int main()
{
    // 상수가 아닌 문자열과 상수 문자열 하나씩 생성
    char str1[] = {'H', 'e', 'l', 'l', 'o', '\0'};
    const char str2[] = {'H', 'e', 'l', 'l', 'o', '\0'};
    // 문자열 리터럴을 사용해 상수 문자열 생성
    const char* str3 = "Goodbye";
    const char* str4 = "Goodbye\0 my friend";
    // 문자열 출력
    cout << "str1: " << str1 << endl;
    cout << "str2: " << str2 << endl;
    cout << "str3: " << str3 << endl;
    cout << "str4: " << str4 << endl << endl;
    // 다섯 번째 문자열을 만들고 입력받아 출력
    char str5[20];
    cout << "str5의 값을 입력하세요: ";
    cin >> str5; 
    cout << "str5: " << str5 << endl;
    return 0;
}