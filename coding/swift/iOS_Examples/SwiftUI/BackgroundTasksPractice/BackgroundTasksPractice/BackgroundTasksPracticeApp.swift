//
//  BackgroundTasksPracticeApp.swift
//  BackgroundTasksPractice
//
//  Created by 문철현 on 2023/03/08.
//

import SwiftUI
import BackgroundTasks

@main
struct BackgroundTasksPracticeApp: App {
    
    init() {
        registerBackgroundTask()
    }
    
    func registerBackgroundTask() {
        let identifier = "com.chmun.BackgroundTasksPractice.refresh"
        
        _ = BGTaskScheduler.shared.register(forTaskWithIdentifier: identifier, using: .main) { task in
            self.addCount()
            task.setTaskCompleted(success: true)
            task.expirationHandler = {
                task.setTaskCompleted(success: false)
            }
        }
    }
    
    func addCount() {
        BackgroundCounter.shared.count += 1
        print("Background Task is called. Count : \(BackgroundCounter.shared.count)")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
