//
//  MyWebView.swift
//  DeepLinkExample
//
//  Created by 문철현 on 2023/06/13.
//

import SwiftUI
import WebKit

// uikit의 uiview를 사용할 수 있도록 해줌
// uiviewcontroller를 사용하고 싶으면 UIViewControllerRepresentable 하면됨
struct MyWebView: UIViewRepresentable {
    
    var urlToLoad: String
    //uiview 만들기
    func makeUIView(context: Context) -> WKWebView {
        //언래핑
        guard let url = URL(string: urlToLoad) else{
            return WKWebView()
        }
        //웹뷰 인스턴스 생성
        let webview = WKWebView()
        //웹뷰 로드
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    //uiview 업데이트
    //context는 uiviewrepresentablecontext로 감싸야 함.
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
        
    }
}
