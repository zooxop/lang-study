import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backgroundColor = .yellow
        
        self.statusBar?.backgroundColor = .yellow
        
    }

}

extension UIViewController {
    
    var statusBar: UIView? {
        // status bar design
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        
        let window = UIApplication.shared.windows.filter{ $0.isKeyWindow }.first
        
        if let hasStatusBar = sceneDelegate?.statusBarView {
            window?.addSubview(hasStatusBar)
        }
        
        return sceneDelegate?.statusBarView
    }
}
