/**************************************************************
 * C 문자열의 길이(널 문자 이전까지의 문자 개수)를            * 
 * 찾아서 출력하는 프로그램                                   *
 **************************************************************/
#include <cstring>
#include <iostream>
using namespace std;

//strlen() : Null문자가 나올때까지 길이를 카운트해준다.
int main()
{
    // 문자열 선언
    const char* str1 = "Hello";  //const : 읽기 전용
    char str2[] = {'H', 'e', '\0', 'l', 'l', 'o', '\0'} ;
    // 문자열의 길이를 찾아서 출력
    cout << "str1의 길이: " << strlen(str1) << endl;  //출력 : 5
    cout << "str2의 길이: " << strlen(str2) << endl;  //출력 : 2('\0'이 중간에 들어가있어서.)
    return 0;
}