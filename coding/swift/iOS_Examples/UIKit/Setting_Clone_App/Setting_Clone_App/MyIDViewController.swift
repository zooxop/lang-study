//
//  MyIDViewController.swift
//  Setting_Clone_App
//
//  Created by 문철현 on 2022/08/17.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.isEnabled = false
        }
    }
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 텍스트 필드에 이벤트 연결
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        // textFieldDidChange(sender: emailTextField)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        // print(sender.text ?? "")
        
        nextButton.isEnabled = (sender.text?.isEmpty == false)

    }

    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
