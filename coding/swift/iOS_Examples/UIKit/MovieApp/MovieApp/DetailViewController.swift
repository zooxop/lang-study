// UIView에 동영상 보여주기 예제

import UIKit
import AVKit

class DetailViewController: UIViewController {

    var movieResult: MovieResult?
    
    var player: AVPlayer?
    
    @IBOutlet weak var movieContainer: UIView!
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = movieResult?.trackName
        self.descriptionLabel.text = movieResult?.longDescription
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let hasURL = movieResult?.previewUrl {
            self.makePlayerAndPlay(urlString: hasURL)
        }
    }
    
    
    func makePlayerAndPlay(urlString: String) {
        if let hasUrl = URL(string: urlString) {
            self.player = AVPlayer(url: hasUrl)
            let playerLayer = AVPlayerLayer(player: self.player)
            
            movieContainer.layer.addSublayer(playerLayer)
            
            playerLayer.frame = movieContainer.bounds
            
            self.player?.play()
        }
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func play(_ sender: Any) {
        self.player?.play()
    }
    
    @IBAction func stop(_ sender: Any) {
        self.player?.pause()
    }
    
}
