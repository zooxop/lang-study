//
//  ViewController.swift
//  QueueExample
//
//  Created by 문철현 on 2022/08/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var finishLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.timerLabel.text = Date().timeIntervalSince1970.description
        }
    }

    @IBAction func action1(_ sender: Any) {
        simpleClosure {
            print("#######")
            // 메인 쓰레드
            DispatchQueue.main.async {
                self.finishLabel.text = "끝"
            }
            
        }
    }
    
    // closure
    // @escaping => 해당 함수의 인자로 클로저가 전달되지만, 함수가 반환된 후 실행 되는 것을 의미.
    // 외부로부터 넘겨받은 클로저를 실행할 때 필요함.
    func simpleClosure(completion: @escaping () -> Void) {
        
        // 추가 쓰레드
        DispatchQueue.global().async {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.1)
                print(index)
            }
            print("TTTTTT")
            completion()
            print("******")
        }
    }

}

