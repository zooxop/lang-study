#include <iostream>
#include "myexeption.h"
using namespace std;

class DynamicArray {
    private:
        int* arr;
        int size;
    public:
        DynamicArray(int arraySize){
            try {
                arr = new int[arraySize];
                size = arraySize;
                throw MyException(this, "생성자 내부에서 예외 발생.", 2000);
            }
            catch(...) {
                cout << "생성자 안쪽 예외처리중.." << endl;
                delete[] arr;
                arr = nullptr;
                throw;
            }
        };

        ~DynamicArray() {
            delete[] arr;
            arr = nullptr;
            cout << this << " : 메모리 제거완료" << endl;
        };

        void setAt(int index, int value) {
            if (index < 0 || index >= getSize()){
                throw MyException(this, "인덱스의 범위를 벗어났습니다. 값을 할당할 수 없습니다.", 1001);
            }
            arr[index] = value;
        };

        int getAt(int index) const {
            if (index < 0 || index >= getSize()){
                // throw 0;
                throw MyException(this, "인덱스의 범위를 벗어났습니다.", 1000);
            }
            return arr[index];
        };

        int getSize() const {
            return size;
        };
};

int main() {
    try {
        DynamicArray a(5);  
        a.setAt(0, 100);
        cout << a.getAt(0) << endl;
        cout << a.getSize() << endl;
        cout << a.getAt(5) << endl;
    }
    catch (int ex){
        cout << ex << " 예외발생!" << endl;
    }
    catch (MyException& ex) {
        cout << "예외코드 : " << ex.code << endl;
        cout << "예외종류 : " << ex.description << endl;
    }
    return 0;
};