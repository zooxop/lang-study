import UIKit


// 숫자(int) 짝수, 홀수
extension Int {
    var oddOrEven: String {
        if self % 2 == 0 {
            return "짝수"
        } else {
            return "홀수"
        }
    }
}


extension UIColor {
    var mainButtonColor: UIColor {
        UIColor(red: 50/255, green: 70/255, blue: 120/255, alpha: 1)
    }
    
    class var subButtonColor: UIColor {
        UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
    }
}

var button = UIButton()
var subButton = UIButton()

button.titleLabel?.textColor = UIColor().mainButtonColor
subButton.titleLabel?.textColor = UIColor.subButtonColor
