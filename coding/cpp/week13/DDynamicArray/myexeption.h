#pragma once
class MyException {
    public:
        const void* sender;  // 예외를 던진 객체의 주소
        const char* description;  // 예외에 대한 설명
        int code;

        MyException(const void* sender,
                    const char* description,
                    int code){

            this->sender = sender;
            this->description = description;
            this->code = code;
        };
        
};