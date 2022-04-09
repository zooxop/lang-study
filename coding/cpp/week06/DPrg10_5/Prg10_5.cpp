/**************************************************************
 * 첨자 연산자를 사용해서                                     *
 * 문자열의 문자에 접근하는 프로그램                          *
 **************************************************************/
#include <cstring>
#include <iostream>
using namespace std;

int main()
{
  // C 문자열 2개 생성
  const char* str1 = "Hello my friends.";
  char str2[ ] = "This is the second string.";
  // 특정 위치의 문자 출력
  cout << "str1의 인덱스 6에 위치하는 문자: " << str1[6] << endl;
  cout << "str1의 인덱스 6에 위치하는 문자: " << *(str1+6) << endl;
  // 특정 위치의 문자 변경
  str2[0] = 't';
  cout << "변경 후의 str2: " << str2;
  return 0;
}