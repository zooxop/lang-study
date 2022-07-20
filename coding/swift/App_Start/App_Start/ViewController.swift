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
        
        // 스토리보드 인스턴스화. name에 스토리보드 "파일 이름"을 넣어주면 된다.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // "Main" storyboard 에서 "DetailVC" 라는 이름의 viewController를 불러와서 인스턴스화 한다.
        // 반드시 storyboard의 "storyboard ID" 속성 값이 설정되어 있어야 한다.
        let detailVC = storyboard.instantiateViewController(identifier: "DetailVC") as DetailVC
        
        // 화면 전환 이벤트
        self.present(detailVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testButton.backgroundColor = UIColor.red
    }
}
