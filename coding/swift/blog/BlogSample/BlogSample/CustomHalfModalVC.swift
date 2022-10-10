// half-screen modal view

import UIKit

protocol modalDelegate: AnyObject {
    func pickedDate(text: String)
}

class CustomHalfModalVC: UIViewController {
    
    lazy var backdropView: UIView = {
        let bdView = UIView(frame: self.view.bounds)
        bdView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return bdView
    }()
    
    weak var delegate: modalDelegate?
            
    let menuView = UIView()
    
    let menuHeight = UIScreen.main.bounds.height / 2  // half 아니고 1/3
    
    var isPresenting = false

    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
        self.view.addSubview(backdropView)
        self.view.addSubview(menuView)
        
        
        menuView.backgroundColor = .systemBackground
        menuView.layer.cornerRadius = 20
        menuView.translatesAutoresizingMaskIntoConstraints = false
        //menuView.frame.width = UIScreen.main.bounds.width
        menuView.heightAnchor.constraint(equalToConstant: menuHeight).isActive = true
        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // 뒷배경 터치하면 모달 내려가도록.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CustomHalfModalVC.handleTap(_:)))
        backdropView.addGestureRecognizer(tapGesture)
        
        
        
        self.temp()
        // self.temp2()

    }
    
    func temp() {
        // To-do: menuView에 subview로 DatePicker, 확인버튼 추가하기.
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 100, width: 414, height: 216))
        datePicker.contentHorizontalAlignment = .center
        // datePicker.intrinsicContentSize = CGSize(width: 414, height: 216)
        // datePicker = UIDatePicker(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        // datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        // datePicker.center = CGPoint(x: 100, y: 30)
        
        // datePicker.frame = CGRect(x: 10, y: 50, width: UIScreen.main.bounds.width, height: 200)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .dateAndTime
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.systemBackground
        datePicker.layer.cornerRadius = 20
        // datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    
        datePicker.addTarget(self, action: #selector(onDidChangeDate(sender:)), for: .valueChanged)
        menuView.addSubview(datePicker)
    }
    
    func testLabel() {
        let label = UILabel(frame: CGRect(x: 100, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 30)
        label.textAlignment = .center
        label.text = "I'm a test label"
        
        menuView.addSubview(label)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func onDidChangeDate(sender: UIDatePicker){
        // Generate the format.
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"

        let selectedDate: String = dateFormatter.string(from: sender.date)
        delegate?.pickedDate(text: selectedDate)   // 마더 폼으로 날짜 보내기
  
    }
}

extension CustomHalfModalVC: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        guard let toVC = toViewController else { return }
        isPresenting = !isPresenting
        
        if isPresenting == true {
            containerView.addSubview(toVC.view)
            
            menuView.frame.origin.y += menuHeight
            backdropView.alpha = 0
            
            UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y -= self.menuHeight
                self.backdropView.alpha = 1
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        } else {
            UIView.animate(withDuration: 0.25, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y += self.menuHeight
                self.backdropView.alpha = 0
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        }
    }
}
