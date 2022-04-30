﻿/**************************************************************
 * Person 클래스의 인터페이스 파일                            *
 **************************************************************/
#ifndef PERSON_H
#define PERSON_H
#include <cassert>
#include <iostream>
#include <iomanip>
using namespace std;

class Person
{
  private: 
    long identity;
    int pri;
  protected:
    int a;
  public:
    int pub;
    Person();
    Person(long identity);
    ~Person();
    Person(const Person& person);
    void print() const;  
};
#endif