// UIPageViewController 연습

import UIKit

class ViewController: UIViewController {

    var didShowOnboardingView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    // viewDidAppear : view controller 화면이 다 그려진 다음에 호출한다.
    // self.present()를 viewDidLoad() 안에서 하면 에러가 발생함. => 아직 화면이 다 그려지지 않았는데 화면을 넘기려고 했기 때문.
    override func viewDidAppear(_ animated: Bool) {
//        let itemVC = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
//        self.present(itemVC, animated: true, completion: nil)
        
        if didShowOnboardingView == false {
            // transitionStyle = 페이지 넘어가는 애니메이션 스타일
            let pageVC = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
            
            pageVC.modalPresentationStyle = .fullScreen  // 모달 창을 전체화면으로 바꿔준다.
            self.present(pageVC, animated: true, completion: nil)
            
            didShowOnboardingView = true
        }
    }
}

