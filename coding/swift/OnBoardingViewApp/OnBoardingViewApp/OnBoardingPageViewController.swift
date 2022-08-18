import UIKit

class OnBoardingPageViewController: UIPageViewController {
    
    // 여러개의 page를 담을 array
    var pages = [UIViewController]()
    var bottomButtonMargin: NSLayoutConstraint?
    var pageControl = UIPageControl()
    let startIndex = 0
    var currentIndex = 0 {
        didSet {
            pageControl.currentPage = currentIndex
        }
    }
    
    func makePageVC() {
        let itemVC1 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC1.topImage = UIImage(named: "onboarding1")
        itemVC1.mainTitleText = "Focus on your ideal buyer"
        itemVC1.descriptionText = "When you write a product description with a huge crowd of buyers in mind, your description become wishy-washy and you end up addressing no one at all"
        
        let itemVC2 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC2.topImage = UIImage(named: "onboarding2")
        itemVC2.mainTitleText = "Entice with benefits"
        itemVC2.descriptionText = "When you sell our own products, we get excited about individual product features and specifications. We live and breathe our company, our website, and our products."
        
        let itemVC3 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC3.topImage = UIImage(named: "onboarding3")
        itemVC3.mainTitleText = "Avoid yeah, yeah phrases"
        itemVC3.descriptionText = "When we're stuck for words and don't know what else to add to our product description, we often add something bland like \"excellent product quality\"."
        
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        
        // 최초 시작 페이지 설정
        setViewControllers([itemVC1], direction: .forward, animated: true, completion: nil)
        
        self.dataSource = self
        self.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makePageVC()
        
        self.makeBottomButton()
        
        self.makePageControl()
        
    }
    
    func makeBottomButton() {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(dismissPageVC), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false  // 오토 레이아웃을 적용시키려면 false로 해줘야 함.
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // safe area layout guide
        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        bottomButtonMargin?.isActive = true
        
        hideButton()
        
        
    }
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex
        
        // 사용자가 직접 터치해서 페이지를 넘기는것을 방지.
        // pageControl.isUserInteractionEnabled = false
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    
    @objc func pageControlTapped(sender: UIPageControl) {
        var _direction: UIPageViewController.NavigationDirection
        
        if sender.currentPage > self.currentIndex {
            _direction = .forward
        } else {
            _direction = .reverse
        }
        setViewControllers([pages[sender.currentPage]], direction: _direction, animated: true)
        
        self.currentIndex = sender.currentPage
        
        buttonPresentationStyle()
    }
    
    @objc func dismissPageVC() {
        self.dismiss(animated: true, completion: nil)
    }

}

extension OnBoardingPageViewController: UIPageViewControllerDataSource {
    
    // 이전 화면이 어떤 화면인지 반환
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        self.currentIndex = currentIndex
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
        
    }
    
    // 다음 화면이 어떤 화면인지 반환
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        self.currentIndex = currentIndex
        
        if currentIndex == (pages.count - 1) {
            return pages.first
        } else {
            return pages[currentIndex + 1]
        }
    }
    
    
}

extension OnBoardingPageViewController: UIPageViewControllerDelegate {
    
    // animating이 끝난 뒤 동작하는 메서드
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let currentVC = pageViewController.viewControllers?.first else {
            return
        }
        
        guard let currentIndex = pages.firstIndex(of: currentVC) else {
            return
        }
        
        self.currentIndex = currentIndex
        
        buttonPresentationStyle()
    }
    
    func buttonPresentationStyle() {
        if currentIndex == (pages.count - 1) {
            self.showButton()
        } else {
            self.hideButton()
        }
        
        
        // Animation style 1
        /*
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
         */
        
        // Animation style 2
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func showButton() {
        bottomButtonMargin?.constant = 0
    }
    
    func hideButton() {
        bottomButtonMargin?.constant = 100
    }
}
