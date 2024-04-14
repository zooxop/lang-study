//
//  AppDelegate.swift
//  SceneTestApp
//
//  Created by 문철현 on 4/14/24.
//

import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate {
  static private(set) var instance: AppDelegate!
  lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
  lazy var statusBarItem2 = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
  private var rootViewNSWindow: NSWindow?
  private var windowDelegate: (any NSWindowDelegate)?
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    AppDelegate.instance = self
    
    // Menubar button 생성
    setButton1()
    setButton2()

    // 처음 생성된 View를 메모리에 보관
    rootViewNSWindow = NSApp.windows.first
    
    // SwiftUI 프레임워크 내부에서 자동 생성, 할당되는 delegate인 SwiftUI.AppKitWindowController 을 메모리에 보관.
    // 앱이 X버튼 또는 cmd+w 입력을 통해 화면에서 사라질 때, delegate가 nil로 초기화되는 버그가 있음.
    // 그래서 앱을 화면에 다시 노출시킬 때마다, 이 delegate를 계속해서 덮어씌워주어 이 버그를 우회한다.
    windowDelegate = NSApp.windows.first!.delegate!
  }
  
  func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
    rootViewNSWindow?.delegate = windowDelegate  // Delegate 덮어씌우기
    rootViewNSWindow?.makeKeyAndOrderFront(self)
    rootViewNSWindow?.orderFront(nil)
    
    NSApp.activate(ignoringOtherApps: true)
    
    return false
  }
  
  func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return false
  }
}

// MARK: - Button 1
extension AppDelegate {
  func setButton1() {
    statusBarItem.button?.image = NSImage(systemSymbolName: "globe", accessibilityDescription: nil)
    statusBarItem.button?.image?.isTemplate = true
    statusBarItem.button?.imagePosition = .imageLeading
    statusBarItem.button?.action = #selector(button1Clicked(_ :))
    statusBarItem.isVisible = true
  }
  
  @objc func button1Clicked(_ sender: NSStatusBarButton) {
    rootViewNSWindow?.delegate = windowDelegate  // Delegate 덮어씌우기

    NSApp.activate(ignoringOtherApps: true)
    
    rootViewNSWindow?.makeKeyAndOrderFront(self)
    rootViewNSWindow?.orderFront(nil)
  }
}

// MARK: - Button 2
extension AppDelegate {
  func setButton2() {
    statusBarItem2.button?.image = NSImage(systemSymbolName: "person", accessibilityDescription: nil)
    statusBarItem2.button?.image?.isTemplate = true
    statusBarItem2.button?.imagePosition = .imageLeading
    statusBarItem2.button?.action = #selector(button2Clicked(_ :))
    statusBarItem2.isVisible = true
  }
  
  @objc func button2Clicked(_ sender: NSStatusBarButton) {
    print("")
    for window in NSApp.windows {
      if type(of: window).className() == "SwiftUI.AppKitWindow" {
        print(window)
        print(window.delegate ?? "current delegate is nil")
      }
    }
  }
}
