/**************************************************************
 * Array 클래스의 구현 파일                                   *
 **************************************************************/
#include "array.h"

// 생성자(힙 메모리에 할당)
Array::Array(int s)
:size(s)
{
  ptr = new double[size];
}
 // 소멸자(힙의 메모리 해제)
Array::~Array()
{
  delete[] ptr;
  ptr = nullptr;
}

int Array::getAt(int index) const{
    if(index < 0 || index > getSize()){
        cout << "인덱스의 범위를 확인하세요\n";
        return 0;
    } else {
        return ptr[index];
    }
}

void Array::setAt(int index, int value) {
    ptr[index] = value;
}

int Array::getSize() const {
    return size;
}