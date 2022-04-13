#include <iostream>
using namespace std;

//#키워드

int main(){
    cout << boolalpha; //이 코드가 실행된 다음부터, cout으로 bool 타입을 출력할 때 1/0 을 true/false로 변환해줌.

    cout << true << " " << false << " " << 'A' << " " << "Hello" << endl;  //bool, character, string
    cout << 23412 << " " << 12897234L << endl; // int, long int(short int는 존재하지 않음.)
    cout << 245.78F << " " << 114.782 << " " << 2.051L << endl;  //float, double, long double

    cout << noboolalpha << "\n" << true << endl; // 다시 1/0 으로 변환하려면 noboolalpha를 사용.

    cout << "\n" << sizeof(int) << endl;  //sizeof() => 메모리 사이즈 리턴. 출력 : 4(운영체제마다 다름.)
    return 0;
}