#include <iostream>
#include "smaller.h"
using namespace std;

int main()
{
  // 매개변수가 3개인 형태 호출
  cout << "smallest(17, 12, 27) = ";
  cout << smallest(17, 12, 27)  << endl;
  // 매개변수가 3개인 형태 호출
  cout << "smallest(8.5, 4.1, 19.75) = ";
  cout << smallest(8.5, 4.1, 19.75) << endl;
  return 0;
}