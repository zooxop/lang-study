/**************************************************************
 * Array 클래스를 사용하는 애플리케이션                     *
 **************************************************************/
#include "array.h"

int main()
{
  // 3개의 요소를 가지는 Array 클래스 인스턴스화
  Array arr(3);
  
  arr.setAt(2, 5000);
  arr.setAt(12, 5000);
  cout << arr.getAt(2) << endl;

//   for(int i=0; i < arr.getSize(); i++){
//       arr
//   }

  return 0;
}