// custom code UI 예제

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customButton: RotateButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 버튼 클릭 이벤트를 클로저로 구현.
        customButton.selectTypeCallback = { upDownType in
            print(upDownType)
        }
        
        let myButton = RotateButton()
        self.view.addSubview(myButton)
        
        myButton.translatesAutoresizingMaskIntoConstraints = false  // auto layout 사용하기 설정
        
        
        // style 1
        // frame으로 위치,크기 한번에 설정하기
        // myButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        
        
        // style 2
        // 위치, 크기 각각 설정하기
        
        // 위치: 정중앙으로 맞추기
        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
         
        // 크기 설정
        // myButton.widthAnchor.constraint(equalToConstant: 200).isActive = true  // 설정 안하면 자동으로 잡힌다.
        myButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        // 배경색 설정
        myButton.backgroundColor = UIColor.orange
        myButton.setTitle("my custom button", for: .normal)
        myButton.setImage(UIImage.init(systemName: "arrowtriangle.down"), for: .normal)
    }


}

