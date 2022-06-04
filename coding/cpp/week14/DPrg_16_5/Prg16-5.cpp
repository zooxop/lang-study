/**************************************************************
 * 출력 파일을 만들고 쓰기 처리하는 프로그램                  *
 **************************************************************/
#include <iostream>
#include <fstream>
#include <cassert>
using namespace std; 

int main()
{
  // ofstream 객체 인스턴스화
  ofstream outStrm;
  // 파일 열기
  outStrm.open("integerFile");

  //ofstream outStrm("integerFile");  // short form
  if(!outStrm.is_open())
  {
    cout << "integerFile을 열 수 없습니다.";
    assert(false);
  }
  // 삽입 연산자 오버로드 함수를 활용해 파일에 쓰기
  for(int i = 1; i <= 10; i++)
  {
    outStrm << i * 10 << "  ";
  }
  // 파일 닫기 
  outStrm.close();
  // return 이후에 ofstream 객체가 소멸
  return 0;
}