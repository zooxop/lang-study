import UIKit


// to-do : bottom safe area 색 맞추기

class ViewController: UIViewController {

    @IBOutlet weak var inputViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var chatTableView: UITableView! {
        didSet {
            chatTableView.delegate = self
            chatTableView.dataSource = self
            chatTableView.separatorStyle = .none
        }
    }
    
    var chatDatas = [String]()
    
    @IBOutlet weak var inputTextView: UITextView! {
        didSet {
            inputTextView.delegate = self
        }
    }
    
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
        
//        let window = UIApplication.shared.windows.first
//        let bottom = window?.safeAreaInsets.bottom
//
//        self.inputView.frame.height += bottom
        
    }
    
    @objc func keyboardWillShow(noti: Notification) {
        // 키보드의 frame 가져오기
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        // 키보드 frame의 높이 - safe area 높이
        let height = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
        
        // 키보드가 올라올/내려올 때 호출되는 애니메이션의 동작시간 가져오기.
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        // Animation 적용
        UIView.animate(withDuration: animationDuration) {
            // 높이 적용해주기
            self.inputViewBottonMargin.constant = height
            
            // layoutIfNeeded => layout 변경에 대한 이벤트를 큐의 뒤쪽이 아닌 앞으로 가져오고
            // 그에 대해 즉시 실행해주는 명령.
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(noti: Notification){
        // 키보드의 frame 가져오기
        let notiInfo = noti.userInfo!
        
        // 키보드가 올라올/내려올 때 호출되는 애니메이션의 동작시간 가져오기.
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottonMargin.constant = 0
            self.view.layoutIfNeeded()
        }
        
        
    }

    @IBAction func sendString(_ sender: Any) {
        chatDatas.append(inputTextView.text)
        inputTextView.text.removeAll()
        
        self.textViewDidChange(inputTextView)
        
        
        let lastIndexPath = IndexPath(row: (chatDatas.count - 1), section: 0)
        // 새로운 row 삽입
        chatTableView.insertRows(at: [lastIndexPath], with: .none)
        
        // 맨 아래로 스크롤
        chatTableView.scrollToRow(at: lastIndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        
        // 화면 갱신할 때, reloadData를 사용하면, 화면이 끊기는 것 처럼 보일 수 있다.
        // chatTableView.reloadData()
        
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
            myCell.myTextView.text = chatDatas[indexPath.row]
            myCell.selectionStyle = .none
            
            return myCell
        } else {
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "YourCell", for: indexPath) as! YourCell
            yourCell.yourTextView.text = chatDatas[indexPath.row]
            yourCell.selectionStyle = .none
            
            return yourCell
        }
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height <= 32 {
            inputViewHeight.constant = 32
        } else if textView.contentSize.height >= 100 {
            inputViewHeight.constant = 100
        } else {
            inputViewHeight.constant = textView.contentSize.height
        }
        
    }
}
