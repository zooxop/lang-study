// Passing data (데이터를 넘겨주는 방법)
// 6가지

// 1. Instance property
// 2. segue (세그웨이?) (여러개의 뷰 컨트롤러가 하나의 스토리보드 파일에 있을 때 주로 사용)
// 3. instance
// 4. delegate (delegation) pattern: 대리, 위임, 대신
// 5. closure pattern
// 6. Notification

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notification
        let notificationName = Notification.Name("sendSomeString")
        
        // Notification 주의점:
        // 같은 옵저버를 여러 번 등록하면, 한 번만 post를 해도 등록한 횟수만큼 동작한다.
        // 따라서, 같은 옵저버를 여러 번 등록하지 않도록 주의해야 함.
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
        
        // Textfield - keyboard 관련 옵저버
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        
        // 옵저버 삭제
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        
    }
    
    @objc func showSomeString(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str
        }
    }
    
    @objc func keyboardWillShow() {
        print("will show")
    }
    @objc func keyboardDidShow() {
        print("Did show")
    }
    
    @IBOutlet weak var dataLabel: UILabel!
    
    // Segue 방식
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetail" {
            if let detailVC = segue.destination as? SegueDetailViewController {
                detailVC.dataString = "abcd"
            }
        }
    }
    
    // property 버튼과 연결
    @IBAction func moveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detailVC.someString = "aaa"
        
        //detailVC.someLabel.text = "BBB"
        /*
         이렇게 바로 접근하면 Crash 발생한다.
         위에서 인스턴스를 생성한 시점에는 someLabel의 상태값은 nil이기 때문.
         1차적으로 크래쉬를 방지하려면, detailVC의 viewDidLoad() 내부에서 접근해야 한다.
         
         * someLabel의 상태값이 nil인 이유 : @IBOutlet이라서 그렇다.
         */
        
        
        self.present(detailVC, animated: true, completion: nil)
        
        
        detailVC.someLabel.text = "BBB"
        /*
         여기서(인스턴스화가 완료된 시점에) 접근하면 크래쉬 안나고 사용 가능함.
         하지만 이런 코딩 스타일은 실수를 유발하므로, 지양하는것이 좋다.
         */
    }
    
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        
        detailVC.mainVC = self
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToDelegate(_ sender: Any) {
        let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
        
        detailVC.myClosure = { str in
            self.dataLabel.text = str
        }
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToNotification(_ sender: Any) {
        let detailVC = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
}

extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLabel.text = string
    }
}
