import UIKit
import PhotosUI

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.contentMode = .scaleAspectFill  // cell 안에 이미지가 딱 들어맞게 보이도록 설정
        }
    }
    
    func loadImage(asset: PHAsset) {
        let imageManager = PHImageManager()
        
        let scale = UIScreen.main.scale
        let imageSize = CGSize(width: 150 * scale, height: 150 * scale)
        
        let options = PHImageRequestOptions()
        options.deliveryMode = .opportunistic  // 자동으로 저화질 -> 고화질 단계를 거쳐가는 모드
        //options.deliveryMode = .highQualityFormat  // 무조건 고화질만.
        //options.deliveryMode = .fastFormat  // 무조건 저화질만.
        
        
        // PHImageManager.requestImage : asset에 들어있는 이미지의 "고유 ID"를 "이미지"로 전환시켜줌.
        // resultHandler : 이미지 할당시 동작 할 코드를 클로저로 넣어주면 됨.
        imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: options) { image, info in
            
            if let isDegraded = info?[PHImageResultIsDegradedKey] as? Bool {
                if isDegraded == true {
                    // 저화질
                    self.photoImageView.image = image
                } else {
                    // 고화질
                    self.photoImageView.image = image
                }
            }
            
            
            
            // info가 옵셔널이므로, 위처럼 if-let으로 가져오는것이 안전함.
//            if (info?[PHImageResultIsDegradedKey] as? Bool) == true {
//                // 저화질
//            } else {
//                // 고화질
//            }
            
        }
    }
}
