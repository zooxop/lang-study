
#include <iostream>
using namespace std;

char* reverse(const char* pstr, int len);

int main()
{ 
  char strg[11] = "HELLO INHA";
  cout << "원본 문자열: " << strg << endl;
  // 문자열 뒤집고 출력
  char* copy = reverse(strg, 10);
  cout << "뒤집은 문자열: " << copy << endl;
  
  delete[] copy;
  copy = nullptr;

  return 0;
} 

char* reverse(const char* pstr, int len){
    char* r = new char[len+1];  //Null 문자 할당을 위해 +1
    for(int i=0; i < len; i++){
        r[i] = pstr[len-i-1];
    }
    r[len] = '\0';

    return r;
}