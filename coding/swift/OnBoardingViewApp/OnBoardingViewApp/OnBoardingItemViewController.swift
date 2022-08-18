import UIKit

class OnBoardingItemViewController: UIViewController {
    
    var mainTitleText = ""
    var descriptionText = ""
    var topImage: UIImage? = UIImage()
    
    @IBOutlet private weak var topImageView: UIImageView!
    @IBOutlet private weak var mainTitleLabel: UILabel! {
        didSet {
            mainTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        }
    }
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTitleLabel.text = mainTitleText
        descriptionLabel.text = descriptionText
        topImageView.image = topImage

    }

}
