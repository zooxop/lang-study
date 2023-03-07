//
//  SegueDetailViewController.swift
//  PassData
//
//  Created by 문철현 on 2022/08/14.
//

import UIKit

class SegueDetailViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLabel.text = dataString
    }
    
}
