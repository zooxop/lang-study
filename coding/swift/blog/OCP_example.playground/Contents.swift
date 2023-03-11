import Foundation

// OCP Before
/*
class IPhone {
    public var name: String?
    public var unlockCase: UnlockCase?
    
    init() { }
    
    enum UnlockCase {
        case fingerPrint
        case faceID
    }
    
    // 잠금해제
    public func unlock() {
        print("\(name!)의 잠금을 해제 합니다.")
        
        switch unlockCase! {
        case .fingerPrint:
            print("지문으로 잠금 해제.")
        case .faceID:
            print("Face ID로 잠금 해제.")
        }
    }
}

class IPhone8: IPhone {
    override init() {
        super.init()
        name = "iPhone 8"
        unlockCase = .fingerPrint
    }
    
    override func unlock() {
        super.unlock()
        print("지문 인식 모듈 호출")
    }
}

class IPhone14: IPhone {
    override init() {
        super.init()
        name = "iPhone 14"
        unlockCase = .faceID
    }
    
    override func unlock() {
        super.unlock()
        print("Face ID 모듈 호출")
    }
}
*/

protocol IPhone {
    var name: String { get }
    var unlocker: Unlocker { get }
    func unlock()
}

class Unlocker {
    func callUnlocker() {
        print("잠금 해제 공통 기능 호출")
    }
}

final class FingerPrint: Unlocker {
    override func callUnlocker() {
        super.callUnlocker()
        print("지문 인식 모듈 호출")
    }
}

final class FaceID: Unlocker {
    override func callUnlocker() {
        super.callUnlocker()
        print("Face ID 모듈 호출")
    }
}

final class Iris: Unlocker {
    override func callUnlocker() {
        super.callUnlocker()
        print("홍채 인식 모듈 호출")
    }
}

class IPhone8: IPhone {
    var name: String
    var unlocker: Unlocker
    
    init() {
        self.name = "iPhone 8"
        unlocker = FingerPrint()  // 지문 인식 사용
    }
    
    func unlock() {
        print("\(name)의 잠금을 해제 합니다.")
        unlocker.callUnlocker()
    }
}

class IPhone14: IPhone {
    var name: String
    var unlocker: Unlocker
    
    init() {
        self.name = "iPhone 14"
        unlocker = FaceID()  // Face ID 사용
    }
    
    func unlock() {
        print("\(name)의 잠금을 해제 합니다.")
        unlocker.callUnlocker()
    }
}

var iPhone8: IPhone = IPhone8()
var iPhone14: IPhone = IPhone14()

iPhone8.unlock()
iPhone14.unlock()
