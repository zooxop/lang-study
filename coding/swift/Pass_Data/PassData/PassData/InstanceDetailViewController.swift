//
//  InstanceDetailViewController.swift
//  PassData
//
//  Created by 문철현 on 2022/08/14.
//

import UIKit

class InstanceDetailViewController: UIViewController {

    var mainVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func sendDataMainVc(_ sender: Any) {
        mainVC?.dataLabel.text = "some Data"
        self.dismiss(animated: true, completion: nil)
    }
    

}
