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
    
    
    @IBAction func action2(_ sender: Any) {
        // DispatchQueue를 묶어줄 수 있는 DispatchGroup
        let dispatchGroup = DispatchGroup()
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        let queue3 = DispatchQueue(label: "q3")
        
        // qos : 우선순위 (Quality of Service)
        // Dispatch queue들간의 작업 우선순위를 결정지어준다.
        
        queue1.async(group: dispatchGroup, qos: .background) {
            // queue 내부에서 queue를 또 열어서 실행하면, 내부의 동작이 다 끝나기 전에 최상단 queue를 탈출해버린다.
            // 그럴 땐 enter(), leave()를 적절히 사용하는것이 좋다.
            
            dispatchGroup.enter()  // 새로운 queue가 실행됨을 알린다.
            DispatchQueue.global().async {
                for index in 0..<10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()  // 새로운 queue를 종료함을 알린다.
            }
        }
        queue2.async(group: dispatchGroup, qos: .userInteractive) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 10..<20 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()
            }
        }
        queue3.async(group: dispatchGroup) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 20..<30 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()
            }
        }
        
        // 그룹 안에 들어있는 모든 dispatchQueue 들의 작업이 완료되었을 때 실행되는 코드.
        dispatchGroup.notify(queue: DispatchQueue.main) {
            print("끝")
        }
        
    }
    
    @IBAction func action3(_ sender: Any) {
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        
        
        // sync : 자신의 작업이 끝날 때 까지 다른 쓰레드를 lock한다.
        queue1.sync {
            for index in 0..<10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        queue2.sync {
            for index in 10..<20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
            
            // deadlock sample
            // deadlock: 상대 작업이 끝날 때까지 서로 기다리기만 하는 상태
//            queue2.sync {
//                for index in 10..<20 {
//                    Thread.sleep(forTimeInterval: 0.2)
//                    print(index)
//                }
//            }
            
            // 위의 예시와 같은 맥락으로, 메인 쓰레드를 sync로 사용 할 수 없다.
            // DispatchQueue.main.sync { ... }  -> 데드락 유발
        }
    }
    

}

