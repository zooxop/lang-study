//
//  ViewController.swift
//  App_Start
//
//  Created by 문철현 on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {

    // @IBOutlet = "화면이랑 연결되어 있는 변수다." 라는 의미.
    @IBOutlet weak var testButton: UIButton!
    
    // @IBAction = 버튼 클릭 이벤트.
    @IBAction func doSomething(_ sender: Any) {
        // 받는 타입(backgroundColor)의 타입이 UIColor이기 때문에, UIColor.orange를 .orange로 생략 가능하다.
        testButton.backgroundColor = .orange
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testButton.backgroundColor = UIColor.red
    }


}

