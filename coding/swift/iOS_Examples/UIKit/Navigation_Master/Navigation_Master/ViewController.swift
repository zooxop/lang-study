import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 타이틀 바꾸기
        // self.title = "메인 화면"
        // self.navigationItem.title = "Main View"
     
        self.setNaviTitleButton()
        self.makeBackButton()
        
        self.naviBackgroundDesign()
        self.makeRightAlarmButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.naviBackgroundDesign()
    }
    
    func makeRightAlarmButton() {
        
        // style 1
        // UIBarButtonItem 사용하기

        /*
        let image = UIImage(systemName: "alarm.fill")?.withRenderingMode(.alwaysOriginal)
        let rightItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(rightItemClick))
        
        let image2 = UIImage(systemName: "alarm")?.withRenderingMode(.alwaysOriginal)
        let rightItem2 = UIBarButtonItem(image: image2, style: .done, target: self, action: #selector(rightItemClick2))
       
        // 버튼간 간격 조정하기
        rightItem2.imageInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20)
        
        self.navigationItem.rightBarButtonItems = [rightItem, rightItem2]
        // self.navigationItem.rightBarButtonItem = rightItem
        // self.navigationItem.rightBarButtonItem = rightItem2
        */
        
        // style 2
        // UIButton 만들고 UIStackView로 감싸서 사용하기
        
        let config = UIImage.SymbolConfiguration(pointSize: 40)  // 이미지 크기 설정하기
        
        let btn1 = UIButton()
        btn1.setImage(UIImage(systemName: "alarm.fill", withConfiguration: config)?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn1.addTarget(self, action: #selector(rightItemClick), for: .touchUpInside)
        
        let btn2 = UIButton()
        btn2.setImage(UIImage(systemName: "alarm"), for: .normal)
        btn2.addTarget(self, action: #selector(rightItemClick2), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [btn1, btn2])
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.distribution = .equalSpacing
        
        let customItem = UIBarButtonItem(customView: stackView)
        
        self.navigationItem.rightBarButtonItem = customItem
        
        
    }
    
    @objc func rightItemClick() {
        print("right item click")
    }
    
    @objc func rightItemClick2() {
        print("right2 item click")
    }
    
    func naviBackgroundDesign() {
        self.navigationController?.navigationBar.backgroundColor = .red
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)  // 빈 이미지를 덮어씌워 반투명 상태를 없애기.
        
        self.statusBar?.backgroundColor = .red
    }
    
    func makeBackButton() {
        // self.navigationItem.backButtonTitle = "뒤로"
        // self.navigationItem.backBarButtonItem = UIBarButtonItem(systemItem: .bookmarks)
        
        // rendering Mode에 .alwaysOriginal을 적용해주면, 무조건 이미지의 원본이 나옴. (tintColor등 적용 불가능.)
        // let backImage = UIImage(systemName: "backward.fill")?.withRenderingMode(.alwaysOriginal)
        
        
        guard let backImage_arrow = UIImage(named: "blueCircleArrowR")?.withRenderingMode(.alwaysOriginal) else {
            return
        }
        
        let newImage = resizeImage(image: backImage_arrow, newWidth: 40, newHeight: 40)
        
        self.navigationController?.navigationBar.backIndicatorImage = newImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = newImage
        self.navigationController?.navigationBar.tintColor = .orange
        
        
        // 버튼 설명 없애기.
        self.navigationItem.backButtonTitle = ""
        
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage? {
        // 해상도에 맞지 않는 이미지를 적용할 때 ->
        // 이미지를 줄인다? -> X
        // 새로운 이미지를 만들어서 적용한다 -> O
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)

        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))  // 도화지 그리기 시작
        image.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()  // 도화지 끝
        
        return newImage
    }
    
    // navigation title을 버튼으로 올리기
    func setNaviTitleButton() {
        let btn = UIButton()
        btn.backgroundColor = .orange
        btn.setTitle("custom button", for: .normal)
        btn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        btn.addTarget(self, action: #selector(testAction), for: .touchUpInside)
        
        self.navigationItem.titleView = btn
    }
    
    
    // navigation bar에 이미지 올리기
    func setNaviTitleImage() {
        let logo = UIImageView(image: UIImage(named: "logoSample.jpg"))
        
        // 이미지 크기 auto layout으로 설정하기
        logo.contentMode = .scaleAspectFit
        logo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.navigationItem.titleView = logo
    }

    @objc func testAction() {
        print("test action")
    }

}

