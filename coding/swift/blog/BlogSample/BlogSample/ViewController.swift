import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("1 :", view.frame.size.width)
      
        // bottom safe area 색칠해주는 custom method
        self.configureCustomView()
        self.menuLabelTest()
    }
    
    func menuLabelTest() {
        let testLabel = MenuLabel()
        testLabel.text = "test 하는 중이라규"
        testLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(testLabel)

        let safeArea = view.safeAreaLayoutGuide
        testLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        testLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50).isActive = true
        testLabel.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
    }
    
    // 화면이 회전될 때 마다 호출되는 메서드
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // 현재 화면의 width 값을 가져온다.
        print("2 :", view.frame.size.width)
    }
    
    // 하단 safe area 색칠하기
    private let myView = UIView()
    private func configureCustomView() {
        var bomttomSafeAreaInsets: CGFloat = 0.0
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        if let hasWindowScene = windowScene {
            bomttomSafeAreaInsets = hasWindowScene.windows.first?.safeAreaInsets.bottom ?? 0
        }
        
        self.myView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.myView)
        self.myView.backgroundColor = .yellow

        NSLayoutConstraint.activate([
            self.myView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.myView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.myView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.myView.heightAnchor.constraint(equalToConstant: bomttomSafeAreaInsets)
        ])
        
    }


}

