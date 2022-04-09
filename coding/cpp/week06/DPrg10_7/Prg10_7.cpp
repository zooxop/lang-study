/**************************************************************
 * strstr 멤버 함수를 사용해서 문자열에서                     *
 * 서브 문자열의 위치를 찾는 프로그램                         *
 **************************************************************/
#include <cstring>
#include <iostream>
using namespace std;

int main()
{
  // 문자열 생성
  char str[]  = "Hello friends of mine.";
  // 서브 문자열의 위치 탐색
  char* sPtr = strstr(str, "friends");
  cout << "서브 문자열의 시작 인덱스: " << sPtr - str << endl;
  return 0;
}  