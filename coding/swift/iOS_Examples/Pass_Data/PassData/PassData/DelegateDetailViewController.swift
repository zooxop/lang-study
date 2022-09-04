//
//  DelegateDetailViewController.swift
//  PassData
//
//  Created by 문철현 on 2022/08/14.
//

import UIKit

// weak 타입으로 인스턴스를 사용하려면 AnyObject 프로토콜을 준수하는 것이 좋다.
protocol DelegateDetailViewControllerDelegate: AnyObject {
    func passString(string: String)
}

class DelegateDetailViewController: UIViewController {

    weak var delegate: DelegateDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func passDataToMainVC(_ sender: Any) {
        delegate?.passString(string: "delegate pass data")
        self.dismiss(animated: true, completion: nil)
    }
    
}
