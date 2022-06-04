/**************************************************************
 * 모든 자료형과 크기의 배열을 출력하는                       *
 * 템플릿 함수를 사용하는 프로그램                            *
 **************************************************************/
#include <iostream>
using namespace std; 

// 템플릿 함수 정의
template <typename T, int N>
void print(T(&array) [N])
{
  for(int i = 0; i < N ; i++)
  {
    cout << array[i] << " ";
  }
  cout << endl;
} 

int main()
{
  // 배열 생성
  int arr1[4] = {7, 3, 5, 1};
  double arr2[3] = {7.5, 6.1, 4.6};
  // 템플릿 함수 호출
  print(arr1);
  print(arr2);
  return 0;
} 