#pragma once

#include <iostream>
using namespace std;

class Final{
private:
    int first;
    int second;

public:
    Final() {
        this->first = 0;
        this->second = 0;
    }

    Final(int first, int second) {
        if (second == 0){
            cout << "0으로 나눌 수 없습니다. 프로그램을 중단합니다." << endl;
            assert(false);
        }
        this->first = first;
        this->second = second;

        this->setGcd();
    }

    ~Final() {

    }

    int getFirst() const {
        return this->first;
    }
    int getSecond() const {
        return this->second;
    }

    void setFirst(int first) {
        this->first = first;
    }
    void setSecond(int second) {
        this->second = second;
    }

    Final operator++() {  // 전위 연산
        this->first = this->first + this->second;
        return *this;
    }

    int gcd(int a, int b) const{
        int c = a % b;
        while (c != 0) {
            a = b;
            b = c;
            c = a % b;
        }
        return b;
    }

    void setGcd() {
        int temp = this->gcd(this->first, this->second);
        if (temp > 1){
            this->first = this->first / temp;
            this->second = this->second / temp;
        }
    }
};
