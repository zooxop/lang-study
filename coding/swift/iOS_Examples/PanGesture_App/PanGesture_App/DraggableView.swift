import UIKit

class DraggableView: UIView {
    
    var dragType = DragType.none
    
    init() {
        super.init(frame: CGRect.zero)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
    }
    
    @objc func dragging(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            print("began")
        case .changed:
            // 부모 뷰를 기준으로 움직인 거리값을 받아옴.
            let delta = pan.translation(in: self.superview)
            
            // 나 자신의 절대 좌표
            var myPosition = self.center
            
            
            // 변경된 값을 재할당해줌.
            if dragType == .X {
                myPosition.x += delta.x
            } else if dragType == .Y {
                myPosition.y += delta.y
            } else {
                myPosition.x += delta.x
                myPosition.y += delta.y
            }
            
            
            // 초기화
            self.center = myPosition
            pan.setTranslation(CGPoint.zero, in: self.superview)
            
        case .ended, .cancelled:
            
            // view가 화면 밖으로 나가지 않도록 처리.
            if self.frame.minX < 0 {
                self.frame.origin.x = 0
            }
            
            if let hasSuperView = self.superview {
                if self.frame.maxX > hasSuperView.frame.maxX {
                    self.frame.origin.x = (hasSuperView.frame.maxX - self.frame.width)
                }
            }
            
            
        default:
            break
        }
    }
    
    // NSCoder를 이용한 이니셜라이저 => Interface builder에서(xib에서) 직접 만들어놓은 객체가 생성될 때 동작한다.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) 는 사용하지 마시기 바랍니다!")  // 다른 사람과 협업 할 때 이런식으로 공지할 수도 있음.
        
//        super.init(coder: coder)
//
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
//        self.addGestureRecognizer(pan)
    }
}
