//
//  ViewController.swift
//  BlogSample
//
//  Created by 문철현 on 2022/09/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("1 :", view.frame.size.width)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("2 :", view.frame.size.width)
    }


}
