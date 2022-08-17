// Pan gesture 연습

import UIKit

enum DragType {
    case X, Y
    case none
}

class ViewController: UIViewController {

    var dragType = DragType.none
    let myView = DraggableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.center = self.view.center
        myView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        myView.backgroundColor = .red
        myView.dragType = .X
        
        self.view.addSubview(myView)
    }

    @IBAction func selectPanType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            dragType = .X
        case 1:
            dragType = .Y
        case 2:
            dragType = .none
        default:
            break
        }
        
        myView.dragType = self.dragType
    }
    
}

