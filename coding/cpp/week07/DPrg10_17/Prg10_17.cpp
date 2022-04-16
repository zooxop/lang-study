/*************************************************************
 * 문자열을 뒤집는 프로그램                                  *
 *************************************************************/
#include <string>
#include <iostream>
using namespace std;

void reverse(string& strg);     // 함수 선언

int main()
{ 
  // 문자열 객체 선언
  string strg;
  // 문자열 입력받고 출력
  cout << "문자열을 입력하세요: ";
  getline(cin, strg);
  cout << "원본 문자열: " << strg << endl;
  // 문자열 뒤집고 출력
  reverse(strg);
  cout << "뒤집은 문자열: " << strg << endl;
  return 0;
} 
/**************************************************************
 * 참조로 전달된 문자열을 뒤집는 함수  *
 **************************************************************/
void reverse(string& strg)
{
  string temp(strg);
  int size = strg.size() ;
  for(int i = 0; i < size; i++)
  {
    strg[i] = temp[size - 1 - i];  
  }
}
