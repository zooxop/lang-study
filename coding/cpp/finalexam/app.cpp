// 12214036/문철현
#include "final.h"
#include "support.h"
#include <vector>
#include <algorithm>
/* final code test (2022/06/11)
- header 파일 안에 인라인 형태로 코드를 작성합니다. (구현 cpp 파일 X, 헤더파일 2개와 app.cpp 제출)
- 헤더 파일이름은 final.h과 support.h이며 app.cpp 파일 및 각 헤더파일 1번 라인에 본인 학번/성명을 반드시 주석처리 합니다.
- class 파일의 멤버 변수는 반드시 캡슐화(private) 합니다. 모든 STL 사용 가능합니다
- 분모에 0이 오면 "0으로 나눌 수 없습니다. 프로그램을 중단합니다."출력 후 assert 매크로로 프로그램 즉시 중단. //예외처리
- 분자와 분모에 약수가 없게 만듭니다. 예) 111/36은 약분해서 37/12로 만들어야 합니다.
- "끝날 때까지 끝난 게 아니다. Yogi Berra" 문구는 특정 객체 소멸시 출력됩니다.
- main함수 코드는 sort함수 안쪽 인수외에는 수정하지 않습니다. (코드 중간 28,29라인 34라인 테스트용으로 주석 풀어보는 것은 가능합니다)
- Final 클래스와 Support 클래스간의 관계는 연관관계 입니다.
*/

/*
 - 연산자 오버로딩
 - vector 사용법
 - 관계 관련 용어 외우기
 - try ~ catch 사용법
 - header file 나누기 (#pragma once / #include는 한군데에서만.)
 - assert(false) 사용법
 */

// #출력 연산자 "<<" 오버로딩.
ostream& operator<<(ostream& out, const Final& right){
    out << right.getFirst() << "/" << right.getSecond();
    return out;
}

istream& operator>>(istream& in, Final& right){
    int first, second = 0;

    cout << "분자 입력: ";
    in >> first;
    right.setFirst(first);

    cout << "분모 입력: ";
    in >> second;
    right.isAvailable();
    right.setSecond(second);
    right.setGcd();
    return in;
}

int main() {
    Final f1(7, 9);
    Final f2(8, 2);
    Final f3(3, 4);
    Final f4;
    Support s1 = new Final(111, 37);

    cout << "f1: " << f1 << endl;
    cout << "f2: " << f2 << endl;
    cout << "f3: " << f3 << endl;
    ++f3;
    cout << "++f3: " << f3 << endl;
    //++f3;
    //cout << "++f3: " << f3 << endl; // 주석 풀면 11/4 출력

//    (*s1).print();
//    s1->print();
//
//    //cout << s1; // 주석 풀면 error
//    cout << "s1: " << static_cast<Final>(*s1) << endl;

    cin >> f4;
    cout << "f4: " << f4 << endl;

    cout << "=============\n";

    vector<Final> vec = { f1, f2, f3, f4 };

    /* sort 함수안쪽의 인수만 수정가능하고 다른 메인함수 부분은 절대 수정하면 안됩니다. (부정행위 처리)
     정렬 기준은 분자가 큰 순으로 먼저 내림차순 정렬하고 분자가 같은 경우에만 분모가 큰 순으로 내림차순 정렬합니다. */
    sort(vec.begin(), vec.end(),[](Final i, Final j){
        if (i.getFirst() != j.getFirst()){
            return i.getFirst() > j.getFirst();
        } else {
            return i.getSecond() > j.getSecond();
        }
    });

    for (auto v : vec)
        cout << v << endl;

    return 0;
}

/*

// 출력 예시 1
f1: 7/9
f2: 4/1
f3: 3/4
++f3: 7/4
s1: 3/1
s1: 3/1
s1: 3/1
분자 입력: 111
분모 입력: 36
f4: 37/12
=============
37/12
7/9
7/4
4/1

끝날 때까지 끝난 게 아니다. Yogi Berra


// 출력 예시 2
f1: 7/9
f2: 4/1
f3: 3/4
++f3: 7/4
s1: 3/1
s1: 3/1
s1: 3/1
분자 입력: 8
분모 입력: 0

0으로 나눌 수 없습니다. 프로그램을 중단합니다.
Assertion failed: false


// 출력 예시 3
f1: 7/9
f2: 4/1
f3: 3/4
++f3: 7/4
s1: 3/1
s1: 3/1
s1: 3/1
분자 입력: 111
분모 입력: 3
f4: 37/1
=============
37/1
7/9
7/4
4/1

끝날 때까지 끝난 게 아니다. Yogi Berra


// 출력 예시 4 (28, 29번 라인 주석 제거 시 출력 화면)
f1: 7/9
f2: 4/1
f3: 3/4
++f3: 7/4
s1: 3/1
s1: 3/1
s1: 3/1
분자 입력: 3
분모 입력: 6
f4: 1/2
=============
7/9
7/4
4/1
1/2

끝날 때까지 끝난 게 아니다. Yogi Berra

*/