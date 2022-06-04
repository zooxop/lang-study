#include <iostream>
#include <vector>
#include <algorithm>  // 정렬 쓰려고.
using namespace std;

class myclass {
public:
    bool operator() (int i, int j){
        return (i > j);  // 내림차순 정렬
    }
} myobj1;

bool sortFunction(int i, int j){
    return (i > j);
}

int main() {
    vector<char> v;
    v.push_back('e');
    v.push_back('b');
    v.push_back('a');
    v.push_back('d');
    v.push_back('c');

    for (auto value: v){
        cout << value << " ";
    }
    cout << endl;

    // 정렬(오름차순)
    sort(v.begin(), v.end());

    // 정렬(내림차순)
    // sort(v.begin(), v.end(), myobj1);
    // sort(v.begin(), v.end(), sortFunction);
    // sort(v.begin(), v.end(), [](char i, char j)->char{ return i > j;});
    sort(v.begin(), v.end(), [](char i, char j){ return i > j;});

    // 정렬 후 출력
    for (auto value: v){
        cout << value << " ";
    }
    cout << endl;

    return 0;
}