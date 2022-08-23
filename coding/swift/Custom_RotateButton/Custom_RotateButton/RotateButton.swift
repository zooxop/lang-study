import UIKit

enum RotateType {
    case up
    case down
}

class RotateButton: UIButton {
    
    private var isUp = RotateType.down {
        didSet {
            changeDesign()
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }
    
    // 버튼 클릭시 동작 클로저
    var selectTypeCallback: ((RotateType) -> Void)?
    
    private func configure() {
        // 버튼 이벤트 할당
        // .touchUpInside : 누르고 놔뒀을 때.
        self.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
    }
    
    @objc private func selectButton() {
        if self.isUp == .up {
            self.isUp = .down
        } else {
            self.isUp = .up
        }
        
        self.selectTypeCallback?(isUp)
    }
    
    private func changeDesign() {
        
        UIView.animate(withDuration: 0.25) {
            if self.isUp == .up {
                self.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.3)  // 투명도 조절
            } else {
                // .identity: 원래 transform 값
                self.imageView?.transform = .identity
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(1.0)
            }
        }
        
    }
    
}
