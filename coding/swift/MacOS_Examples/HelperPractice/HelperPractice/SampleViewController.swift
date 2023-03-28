//
//  SampleViewController.swift
//  HelperPractice
//
//  Created by 문철현 on 2023/03/27.
//

import Cocoa

class SampleViewController: NSViewController {

    @IBOutlet var resultTextView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func clickedRunButton(_ sender: Any) {
        resultTextView.string = "rajephon.github.io"
    }
}

extension SampleViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> SampleViewController {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier("SampleViewController")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? SampleViewController else {
            fatalError("Why cant i find SampleViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}
