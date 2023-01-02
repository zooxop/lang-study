//
//  WebViewController.swift
//  WebView
//
//  Created by 문철현 on 2023/01/02.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var url = "https://google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.navigationDelegate = self
        
        self.webView.load(URLRequest(url: URL(string: url)!))
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.webView.evaluateJavaScript("document.title") { (result, error) in
            self.navigationItem.title = result as? String
        }
    }
}
