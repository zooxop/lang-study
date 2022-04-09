/**************************************************************
 * strcpy와 strncpy 함수를 사용해서                           *
 * 문자열 전체 또는 문자열 일부를                             *
 * 다른 문자열로 복사하는 프로그램                            *
 **************************************************************/
#include <cstring>
#include <iostream>
#include <string>
using namespace std;

// #pragma warning(disable: 4996)  //strcpy 보안 문제를 무시하기 위한 코드. 윈도우만 적용되므로, 맥이나 리눅스는 쓸 필요 없다.
int main()
{
    string s1 = "This is the first string.";
    string s2 = "This is the second string.";
    s1 = s2;
    cout << "s1: " << s1 << endl;
    // str2 전체를 str1으로 복사 후에 str1의 내용이 제거
    char str1[] = "This is the first string.";
    char str2[] = "This is the second string.";
    strcpy(str1, str2);  // strcpy(Destination, Source)
    cout << "str1: " << str1 << endl;
    // str4의 일부를 str3로 복사 후에 str3의 내용 일부 제거
    char str3[] = "abcdefghijk.";
    const char* str4 = "ABCDEFGHIJK";
    strncpy(str3, str4, 4);
    cout << "str3: " << str3 << endl;
    return 0;
}