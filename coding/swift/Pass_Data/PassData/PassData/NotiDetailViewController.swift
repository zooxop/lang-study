//
//  NotiDetailViewController.swift
//  PassData
//
//  Created by 문철현 on 2022/08/14.
//

import UIKit

class NotiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func notiAction(_ sender: Any) {
        let notificationName = Notification.Name("sendSomeString")
        let strDic = ["str" : "noti String"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: strDic)
        self.dismiss(animated: true)
    }
    
}
