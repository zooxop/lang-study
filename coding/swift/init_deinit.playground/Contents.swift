/* 인스턴스 생성과 소멸 */

// 이니셜라이저와 디이니셜라이저
// init, deinit

import Swift

// MARK: - 프로퍼티 기본값

// 스위프트의 모든 인스턴스는 초기화와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야 한다.
// 프로퍼티에 미리 기본값을 할당해두면, 인스턴스가 생성됨과 동시에 초기값을 지니게 된다.

class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당.
    // 기본값을 지정하지 않으면 에러 발생함.
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

let jason: PersonA = PersonA()
jason.name = "jason"
jason.age = 30
jason.nickName = "j"

// MARK: - 이니셜라이저

// 프로퍼티 기본값을 지정하기 어려운 경우에는
// "이니셜라이저" 를 통해 인스턴스가 가져야 할 초기값을 전달할 수 있다.
// 이니셜라이저 => C++, Java의 생성자와 같은 역할

class PersonB {
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String){
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나")


// MARK: - 프로퍼티의 초기값이 꼭 필요하지는 않을 때 => 옵셔널을 사용한다.

class PersonC {
    var name: String
    var age: Int
    var nickName: String?  // 옵셔널을 사용하여 초기값 설정을 건너뛴다.
    
    convenience init(name: String, age: Int, nickName: String) {
        // 아래에 만들어놓은 매개변수 2개짜리 이니셜라이저를 활용할 수 있다.
        // 대신 사용하려면, "convenience" 키워드를 사용해줘야 한다.
        self.init(name: name, age: age)
//        self.name = name
//        self.age = age
        self.nickName = nickName
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")

// 암시적 추출 옵셔널은 인스턴스 사용에 꼭 필요하지만,
// 초기값을 할당하지 않고자 할 때 사용한다.

class Puppy {
    var name: String
    var owner: PersonC!  // "?"가 아닌 "!" 사용. (암시적 추출 옵셔널)
    
    init(name: String) {
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다.")
    }
}

let happy: Puppy = Puppy(name: "happy")
// happy.goOut()  // Error 발생. 아직 owner 프로퍼티가 초기화 되어있지 않기 때문.
happy.owner = jenny
happy.goOut()



// MARK: - 실패가능한 이니셜라이저
// 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우, 인스턴스 생성에 실패할 수 있다.
// 인스턴스 생성에 실패하면 nil을 반환한다.
// 그래서, 실패가능한 이니셜라이저의 반환 타입은 옵셔널 타입이다.

class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    // nil이 반환될 수 있기 때문에, 반환 타입을 "옵셔널"로 선언해준다. ("init?" 사용)
    init?(name: String, age: Int) {
        if (0...120).contains(age) == false {
            return nil
        }
        
        if name.count == 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

// let john: PersonD = PersonD(name: "john", age: 23)  // Error. 옵셔널로 반환받도록 선언하지 않으면 에러가 난다.
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)

print(joker)  // nil
print(batman)  // nil


// MARK: - 디이니셜라이저

// deinit은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출된다.
// 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있다.
// C++ 클래스의 소멸자와 같은 역할.

class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC){
        self.name = name
        self.child = child
    }
    
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다.")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil  // donald 인스턴스를 메모리상에서 해제시킨다. => 디이니셜라이저가 실행됨.
