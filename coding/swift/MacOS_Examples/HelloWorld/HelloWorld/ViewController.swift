//
//  ViewController.swift
//  HelloWorld
//
//  Created by 문철현 on 2022/12/27.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var testLabel: NSTextField!
    @IBOutlet weak var testTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.testLabel.stringValue = "Hello World!!"
        self.testTextField.bind(.value, to: [String(): Bool()], withKeyPath: "asdf", options: [.continuouslyUpdatesValue: true])
        
        
        
        print("1111")
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            
            print("2222")
        }
    }


}

