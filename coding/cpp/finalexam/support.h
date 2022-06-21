#pragma once

class Support{
private:
    Final* final;

public:
    Support(Final* final){
        this->final = final;
    };

    ~Support(){
        delete final;
        final = nullptr;
        cout << "끝날 때 까지 끝난게 아니다. Yogi Berra" << endl;
    }

    void print() const{
        cout << final->getFirst() << "/" << final->getSecond() << endl;
    }
};