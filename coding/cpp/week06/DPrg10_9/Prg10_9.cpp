/**************************************************************
 * strcmp 함수와 strncmp 함수를 사용해서                      *
 * 두 문자열을 비교하는 프로그램                              *
 **************************************************************/
#include <cstring>
#include <iostream>
using namespace std;

int main()
{
    // C 문자열 생성
    const char* str1 = "Hello Alice.";
    const char* str2 = "Hello John.";
    const char* str3 = "Hello Betsy.";

    if (str1 == str2){
        cout << "두 문자열이 같습니다.\n";
    } else {
        cout << "두 문자열이 다릅니다.\n";
    }

    if(strcmp(str1, str2) == 0){
        cout << "두 문자열이 같습니다.\n" << endl;
    } else if(strcmp(str1, str2) <= -1) {
        cout << "두 문자열이 다릅니다.(앞 문자열의 아스키코드 값이 더 작다.)" << endl;
    } else if(strcmp(str1, str2) >= 1) {
        cout << "두 문자열이 다릅니다.(뒤 문자열의 아스키코드 값이 더 작다.)" << endl;
    }

    // 문자열 전체 비교
    cout << "str1과 str2 비교하기: ";
    cout  << strcmp(str1, str2) << endl;
    cout << "str2와 str3 비교하기: ";
    cout << strcmp(str2, str3) << endl;
    // 앞의 5문자만 비교
    cout << "str1과 str2의 앞 5문자만 비교하기: ";
    cout << strncmp(str1, str2, 5) << endl;
    return 0;
} 