#pragma once
#include <iostream>
#include <string>
using namespace std;

class Student {
private:
    int number;
    string name;
    int kor;
    int eng;
    int math;

public:
    Student(){
        this->number = 0;
        this->name = "";
        this->kor = 0;
        this->eng = 0;
        this->math = 0;
    };

    Student(int number, const string& name, int kor, int eng, int math){
        this->number = number;
        this->name = name;
        this->kor = kor;
        this->eng = eng;
        this->math = math;
    };

    Student(const Student& std){

    };

    ~Student(){

    };

    int getNumber() const {
        return this->number;
    }

    string getName() const {
        return this->name;
    }

    int getKor() const {
        return this->kor;
    }

    int getEng() const {
        return this->eng;
    }

    int getMath() const {
        return this->math;
    }

    double getAvg() const {
        return (this->kor + this->eng + this->math) / 3;
    }

};