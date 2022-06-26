/* 옵셔널 체이닝 */

// 옵셔널 체이닝은 옵셔널 요소 내부의 프로퍼티로
// 또다시 옵셔널이 연속적으로 연결되는 경우 유용하게 사용할 수 있다.

import Swift

class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String){
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String){
        buildingNumber = dong
        roomNumber = ho
    }
}

let yagom: Person? = Person(name: "yagom")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

// 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로
// 결과 타입도 옵셔널이다.

// 만약 우리집 경비원의 직업이 궁금하다면..?

// 옵셔널 체이닝을 사용하지 않았을 때
func guardJob(owner: Person?){
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다.")
                } else {
                    print("우리집 경비원은 직업이 없다.")
                }
            }
        }
    }
}

guardJob(owner: yagom)


// 옵셔널 체이닝을 사용했을 때
func guardJobWithOptionalChaining(owner: Person?){
    if let guardJob = owner?.home?.guard?.job {
        print("우리집 경비원의 직업은 \(guardJob)입니다.")
    } else {
        print("우리집 경비원은 직업이 없다.")
    }
}

guardJobWithOptionalChaining(owner: yagom)



yagom?.home?.guard?.job  // nil

yagom?.home = apart

yagom?.home  // Optional(Apartment)
yagom?.home?.guard  // nil


yagom?.home?.guard = superman
                    
yagom?.home?.guard  // Optional(Person)

yagom?.home?.guard?.name  // superman
yagom?.home?.guard?.job  // nil

yagom?.home?.guard?.job = "경비원"



// nil 병합 연산자

var guardJob: String

guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"  //  yagom?.home?.guard?.job 값들 중 하나라도 nil이라면, guardJob 변수에 "슈퍼맨"을 할당해달라.
print(guardJob)  // 경비원

yagom?.home?.guard?.job = nil

guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
print(guardJob)  // 슈퍼맨
