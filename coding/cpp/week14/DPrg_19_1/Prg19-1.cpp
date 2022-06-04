#include <vector>
#include <iterator>
#include <iostream>

using namespace std;

int main() {
    vector<int> vec(10);
    vector<int>::iterator iter;
    vector<int>::reverse_iterator rIter;

    for (int i=0; i < 10; i++){
        vec.at(i) = i * i;
    }

    cout << "기본 탐색: ";
    for (auto v : vec){
        cout << " " << v;
    }
    cout << endl;

    cout << "기본 탐색: ";
    for (auto iter = vec.begin(); iter != vec.end(); ++iter){
        cout << " " << *iter;
    }
    cout << endl;

    cout << "역 탐색: ";
    for (auto rIter = vec.rbegin(); iter != vec.end(); ++rIter){
        cout << " " << *rIter;
    }
    cout << endl;

    return 0;
}