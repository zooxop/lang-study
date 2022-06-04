/**************************************************************
 * 기존의 파일을 읽고 모니터에                                * 
 * 데이터를 출력하는 프로그램                                 *
 **************************************************************/
#include <iostream>
#include <fstream>
#include <cassert>
using namespace std; 

int main()
{
  int data;
  // ifstream 객체 인스턴스화
  ifstream inStrm;
  // ifstream 객체와 파일 연결
  inStrm.open("integerFile");
  if(!inStrm.is_open())
  {
    cout << "integerFile을 열 수 없습니다.";
    assert(false);
  }
  // ifstream 객체로 파일 읽고 모니터에 출력
  for(int i = 1; i <= 10; i++)
  {
    inStrm >> data;
    cout << data << "  ";
  }
  // 파일 닫기
  inStrm.close();
  // return 이후에 ifstream 객체가 소멸
  return 0;
}