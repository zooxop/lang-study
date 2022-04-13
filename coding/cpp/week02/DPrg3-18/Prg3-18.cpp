/************************************************************
 * 부호 없는 정수 자료형의 오버플로우와 언더플로우 확인하기 *
 *************************************************************/
#include <iostream>
#include <limits>
using namespace std;
//#지수식 #scientific #showpos #조정자 #Manipulator
//#최대값 #최소값 #numeric_limits<type>::max()
int main()
{
    int number = 0;
    double x = 3916.93;
    cout << x << endl;
    cout << scientific;  // scientific : 지수식으로 표현하자. (fixed의 반대 표현)
    cout << x << endl;

    cin >> number;
    cout << showpos; // showpos/noshowpos : 음수가 아닌 정수 출력에서 더하기 부호 '+' 표시를 활성화/비활성화.
    //cout << oct; // hex;  //조정자 (Manipulator)  //출력을 10진수/16진수 변환 할 때. oct:8진수 / hex:10진수
    cout << number << endl;

    // 부호 없는 정수의 최대값과 최소값 검색
    unsigned int num1 = numeric_limits<unsigned int>::max(); //변수 타입의 최대값
    unsigned int num2 = numeric_limits<unsigned int>::min(); //변수 타입의 최소값
    // 최대값과 최소값 출력
    cout << "부호 없는 정수의 최대값: " << num1 << endl;
    cout << "부호 없는 정수의 최소값: " << num2 << endl;
    // 강제로 오버플로우와 언더플로우 발생
    num1 += 1;
    num2 -= 1;
    // 오버플로우와 언더플로우된 값 출력
    cout << "오버플로우가 일어난 num1 + 1의 값: " << num1 << endl;
    cout << "언더플로우가 일어난 num2 - 1의 값: " << num2 << endl;
    return 0;
}