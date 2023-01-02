//
//  WebView.swift
//  WebView
//
//  Created by 문철현 on 2023/01/02.
//

import Foundation
import WebKit
import SwiftUI

// SwiftUI WebView
struct WebView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> some UIView {
        let url = URL(string: self.url)
        let request = URLRequest(url: url!)
        
        let wkWebView = WKWebView()
        wkWebView.load(request)
        
        return wkWebView
        
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

// UIKit WebView (with. UIViewController)
struct MyWebVC: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let webVC = UIStoryboard(name: "WebViewController", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        
        let navi = UINavigationController(rootViewController: webVC)
        
        return navi
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
