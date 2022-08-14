//
//  DetailViewController.swift
//  PassData
//
//  Created by 문철현 on 2022/08/13.
//

import UIKit

class DetailViewController: UIViewController {
    
    var someString = ""

    @IBOutlet weak var someLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        someLabel.text = someString
    }

}
