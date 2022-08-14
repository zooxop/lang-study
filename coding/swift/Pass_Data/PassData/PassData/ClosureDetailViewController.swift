//
//  ClosureDetailViewController.swift
//  PassData
//
//  Created by 문철현 on 2022/08/14.
//

import UIKit

class ClosureDetailViewController: UIViewController {
    
    var myClosure: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func closurePassData(_ sender: Any) {
        
        myClosure?("closure String")
    }
    
}
