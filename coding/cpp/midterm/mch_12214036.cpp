#include <iostream>
#include <string>
#include <array>

using namespace std;


void printTemplete();
void printMovies();
void printTimeTable(int movieCode);
void printSits(int idx,int rMax, int cMax);

class Movie {
    private:
        int movieCode;
        string movieName;
        int movieOrder;
        int grade;  //0 전체 / 1 12세 / 2 15세 / 3 18세 
        string place;  //A or B
        string time; //상영시간
        bool isDiscount = false;
        int maxCust;
        int tempCust;
    
    public:
        int** sits = nullptr;
        Movie();
        Movie(int movieCode, int grade, const string& place, const string& time, bool isDiscount, int movieOrder);
        Movie(const Movie& std);
        ~Movie();

    int getMovieCode() const {
        return movieCode;
    }

    int getMaxCust() const {
        return maxCust;
    }

    int getTempCust() const {
        return tempCust;
    }

    void setTempCust(int cust){
        tempCust = cust;
    }

    string getMovieName() const {
        return movieName;
    }

    string getMoviePlace() const {
        return place;
    }

    string getTime() const {
        return time;
    }

    int getMovieOrder() const {
        return movieOrder;
    }

    int getGrade() const {
        return grade;
    }

    bool getIsDiscount() const {
        return isDiscount;
    }

    string getPlace() const {
        return place;
    }

    
    static int childFee; // 어린이(12세 미만) : 5000원
    static int midFee; //청소년(12세~17세) : 9000원
    static int highFee; //성인(18세 이상) : 11000원
};
int Movie::childFee = 5000;
int Movie::midFee = 9000;
int Movie::highFee = 11000;

static Movie* movies;

Movie::Movie(int movieCode, int grade, const string& place, const string& time, bool isDiscount, int movieOrder){
    this->movieOrder = movieOrder;
    this->movieCode = movieCode;
    switch (movieCode) {
    case 1:
        this->movieName = "1917";
        break;
    case 2:
        this->movieName = "무간도";
        break;
    case 3:
        this->movieName = "타짜";
        break;
    case 4:
        this->movieName = "스폰지밥 극장판";
        break;
    default:
        this->movieName = "";
        break;
    }
    this->grade = grade;
    this->place = place;
    this->time = time;
    this->isDiscount = isDiscount;

    if (place == "A") {
        this->sits = new int* [6];  //행(세로)
        for(int i=0; i < 6; i++){
            *(this->sits + i) = new int[15]; //열(가로)
        }
        
        for(int i=0; i < 6; i++){
           for(int j=0; j < 15; j++){
                this->sits[i][j] = 0;  //0이면 빈 좌석, 1이면 잡은 좌석
            }
        }

        this->maxCust = 90;
        this->tempCust = 0;

    } else if (place == "B") {
        this->sits = new int* [7];  //행(세로)
        for(int i=0; i < 7; i++){
            *(this->sits + i) = new int[20]; //열(가로)
        }

        for(int i=0; i < 7; i++){
           for(int j=0; j < 20; j++){
                this->sits[i][j] = 0;  //0이면 빈 좌석, 1이면 잡은 좌석
            }
        }

        this->maxCust = 140;
        this->tempCust = 0;
    } 
    
}

Movie::Movie() {
    
}

Movie::Movie(const Movie& std){
    
}

Movie::~Movie() {
    if (this->place == "A") {
        for(int i=0; i < 6; i++){
            delete this->sits[i];
        }
        delete[] this->sits;
        this->sits = nullptr;
    } else if (this->place == "B") {
        for(int i=0; i < 7; i++){
            delete this->sits[i];
        }
        delete[] this->sits;
        this->sits = nullptr;
    }
}

int main() {
    int menu = 0;

    movies = new Movie[]{
            Movie(4, 1, "B", "9:50", true, 1),
            Movie(4, 1, "B", "18:00", false, 2),
            Movie(4, 1, "B", "21:15", false, 3),

            Movie(1, 3, "A", "8:00", true, 1),
            Movie(1, 3, "A", "12:00", false, 2),
            Movie(1, 3, "A", "15:00", false, 3),
            Movie(1, 3, "A", "21:00", false, 4),

            Movie(3, 4, "A", "7:20", true, 1),
            Movie(3, 4, "A", "23:30", true, 2),

            Movie(2, 2, "B", "7:20", true, 1),
            Movie(2, 2, "B", "11:30", false, 2),
            Movie(2, 2, "B", "13:00", false, 3),
            Movie(2, 2, "B", "23:00", true, 4)
    };

    do {
        printTemplete();
        cin >> menu;

        switch (menu) {
        case 1:  //영화 예매
            printMovies();
            int selMov;
            cin >> selMov;
            
            printTimeTable(selMov);


            break;
        case 2:  //프로그램 종료
            cout << "프로그램을 종료합니다." << endl;
            break;
        default:
            break;
        }
    } while(menu != 2);


    return 0;
}

void printTemplete(){
    cout << " ============================================= " << endl;
    cout << " 1. 영화 예매 " << endl;
    cout << " 2. 프로그램 종료 " << endl;
    cout << " ============================================= " << endl;
    cout << " 원하시는 메뉴를 선택해 주세요: ";
}

void printMovies(){
    cout << " ============================================= " << endl;
    cout << " 1.    1917    /  15세 관람가   / A관 " << endl;
    cout << " 2.    무간도     /  12세 관람가   / B관 " << endl;
    cout << " 3.     타짜     /  18세 관람가   / A관 " << endl;
    cout << " 4.  스폰지밥 극장판  /   전체 이용가   / B관 " << endl;
    cout << " ============================================= " << endl;
    cout << " 관람하실 영화를 선택해 주세요: ";
}

void printTimeTable(int movieCode){
    cout << " ============================================= " << endl;
    for(int i=0; i < 14; i++){
        if(movieCode == movies[i].getMovieCode()){
            cout << " " << movies[i].getMovieOrder() << "." << "\t" 
                 << movies[i].getTime() << "\t"
                 << movies[i].getTempCust() << " / "
                 << movies[i].getMaxCust() << endl;
        }
    }
    cout << " ============================================= " << endl;
    cout << "관람하실 시간을 선택해 주세요: ";
    int selTime;
    cin >> selTime;

    int people = 0;
    int totalPrice = 0;
    int childCnt = 0;
    int midCnt = 0;
    int highCnt = 0;

    for(int i=0; i < 14; i++){
        int rMax = 0;
        int cMax = 0;

        if(movieCode == movies[i].getMovieCode() && selTime == movies[i].getMovieOrder()) {
            if (movies[i].getIsDiscount()){
                cout << endl << "조조 시간대입니다. 가격이 50% 할인됩니다." << endl << endl;
            }
            cout << "몇 분이 오셨습니까? : ";
            cin >> people;

            for(int j=0; j < people; j++){
                cout << "나이는? : ";
                int tempAge = 0;
                cin >> tempAge;

                if(tempAge < 12){
                    totalPrice += Movie::childFee;
                    childCnt++;
                } else if (tempAge >= 12 && tempAge < 18){
                    totalPrice += Movie::midFee;
                    midCnt++;
                } else {
                    totalPrice += Movie::highFee;
                    highCnt++;
                }
            }

            if (movies[i].getIsDiscount()){
                totalPrice = totalPrice / 2;
            }
            

            if (movies[i].getPlace() == "A"){
                rMax = 6;
                cMax = 15;
            } else {
                rMax = 7;
                cMax = 20;
            }

            cout << "\t";
            for (int t=1; t <= cMax; t++){
                cout << t << "\t";
            }
            cout << endl;

            for(int j=0; j < people; j++){
                printSits(i, rMax, cMax);

                cout << j+1 << "번째 관객분의 행을 선택해 주세요 (알파벳): ";
                char rSit;
                cin >> rSit;

                cout << j+1 << "번째 관객분의 좌석번호를 선택해 주세요 (숫자): ";
                int cSit;
                cin >> cSit;

                movies[i].sits[rSit-97][cSit] = 1;

                cout << "저장했습니다." << endl;
            }  

        }
        
    }

    

}

void printSits(int idx, int rMax, int cMax){
    for(int q=0; q < rMax; q++){
        cout << char('A'+q) << "\t";
        for(int w=0; w < cMax; w++){
            if(movies[idx].sits[q][w] == 0){
                cout << "." << "\t";    
            } else {
                cout << "#" << "\t";
            }
            
        }
        cout << endl;
    }
}