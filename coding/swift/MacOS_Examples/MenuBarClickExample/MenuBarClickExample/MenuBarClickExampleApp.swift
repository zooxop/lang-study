//
//  MenuBarClickExampleApp.swift
//  MenuBarClickExample
//
//  Created by 문철현 on 2023/06/01.
//

import SwiftUI

@main
struct MenuBarClickExampleApp: App {
//    @AppStorage("showMenuBarExtra") private var showMenuBarExtra = true
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        /*
        MenuBarExtra(isInserted: $showMenuBarExtra) {
            StatusMenu()
        } label: {
            Label("Menu Bar", systemImage: "star")
                .contextMenu {
                    Button("Right Click") {
                        print("adsf")
                    }
                }
        }
        .menuBarExtraStyle(.menu)
         */
        /*
        if #available(macOS 13.0, *) {
            MenuBarExtra(isInserted: $showMenuBarExtra) {
                StatusMenu()
            } label: {
//                Label("Menu Bar", systemImage: "star")
                Image(systemName: "star")
                    .contextMenu {
                        Button("Right Click") {
                            print("adsf")
                        }
                    }
            }
        }
        */
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?

    func applicationDidFinishLaunching(_ notification: Notification) {
        setupMenuBar()
    }

    func setupMenuBar() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        statusItem?.button?.image = NSImage(systemSymbolName: "star", accessibilityDescription: nil)
        statusItem?.button?.action = #selector(toggleMenu(sender:))
        statusItem?.button?.sendAction(on: [.leftMouseUp, .rightMouseUp])
    }

    @objc func toggleMenu(sender: NSStatusBarButton) {
        if let event = NSApp.currentEvent {
            switch event.type {
            case .rightMouseUp:
                // Show context menu
                let menu = NSMenu()
                menu.addItem(withTitle: "Right 1", action: nil, keyEquivalent: "")
                menu.addItem(withTitle: "Right 2", action: nil, keyEquivalent: "")
                menu.addItem(withTitle: "Right 3", action: nil, keyEquivalent: "")
                statusItem?.menu = menu
                statusItem?.button?.performClick(nil)
            case .leftMouseUp:
                // Show context menu
                let menu = NSMenu()
                menu.addItem(withTitle: "Left 1", action: nil, keyEquivalent: "")
                menu.addItem(withTitle: "Left 2", action: nil, keyEquivalent: "")
                menu.addItem(withTitle: "Left 3", action: nil, keyEquivalent: "")
                statusItem?.menu = menu
                statusItem?.button?.performClick(nil)
            default:
                break
            }
        }
    }
}
