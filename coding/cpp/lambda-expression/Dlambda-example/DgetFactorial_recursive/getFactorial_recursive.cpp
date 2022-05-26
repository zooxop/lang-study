#include <iostream>
#include <functional>
using namespace std;
/* 
    #람다함수정리
    1. 익명함수이다. 함수 객체를 생성한다.
    2. 함수 포인터와 함수객체의 장점을 지닌다.
    3. 캡쳐 기능을 통해, 함수 바깥의 변수에 접근할 수 있고, 옵션 설정(& 기호)을 통해 람다 함수 내부에서도 외부 변수의 값을 변경할 수 있다.
    4. 재귀 호출도 가능하다.
*/
// #팩토리얼 #재귀 #functional
int main() {
    // 람다에서 재귀를 구현할 때 auto 타입으로는 추론이 불가능하다.
    // 반드시 대입하려고 하는 함수의 타입이 명시되어야 한다.


    // 람다 내부에서, 자기 자신을 재귀로 호출할때는 functional 라이브러리의 function 타입으로 리턴을 받아야 한다.
    // 그리고 캡쳐블럭에 자기 자신을 명시해줘야만 참조할 수 있다.
    function<int(int)> fact = [&fact](int n) -> int {
        return n <= 1 ? 1 : n * fact(n-1);
        // if (n <= 1){
        //     return 1;
        // } else {
        //     return n * fact(n-1);  // 재귀 호출
        // }
    };

    cout << fact(5) << endl;

    return 0;
}