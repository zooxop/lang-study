import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var inputTextView: UITextView!
    
    @IBOutlet weak var inputViewBottonMargin: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 사용하려는 셀을 등록해야 사용할 수 있음.
        chatTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        chatTableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "YourCell")
        
        // 키보드 관련 옵저버 - 상태를 알려줌
        // - 키보드가 올라올 때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        // - 키보드가 내려갈 때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(noti: Notification) {
        // 키보드의 frame 가져오기
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        // 키보드 frame의 높이
        let height = keyboardFrame.size.height
        
        // 높이 적용해주기
        inputViewBottonMargin.constant = height
    }
    
    @objc func keyboardWillHide(noti: Notification){
        inputViewBottonMargin.constant = 0
    }

    @IBAction func sendString(_ sender: Any) {
        
    }
    
}

