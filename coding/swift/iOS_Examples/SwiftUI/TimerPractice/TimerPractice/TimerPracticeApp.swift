//
//  TimerPracticeApp.swift
//  TimerPractice
//
//  Created by 문철현 on 2023/03/08.
//

import SwiftUI
import BackgroundTasks

@main
struct TimerPracticeApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    init() {
        // registerBackgroundTask()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase, perform: { newValue in
            switch newValue {
            case .background: scheduleAppRefresh()
            default: break
            }
        })
        .backgroundTask(.appRefresh("com.chmun.TimerPractice.bgtask")) {
            //VPNTimer.shared.count += 1
            print("Background Tasks")
            VPNTimer.shared.startTimer()
        }
    }
    
    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.chmun.TimerPractice.bgtask")
            request.earliestBeginDate = .now.addingTimeInterval(24 * 3600)
            try? BGTaskScheduler.shared.submit(request)
            print("")
    }
    
    func registerBackgroundTask() {
        let identifier = "com.chmun.TimerPractice.bgtask"
        
        _ = BGTaskScheduler.shared.register(forTaskWithIdentifier: identifier, using: .main) { task in
            print("register BGTaskScheduler")
            VPNTimer.shared.startTimer()
            task.setTaskCompleted(success: true)
//            task.expirationHandler = {
//                task.setTaskCompleted(success: false)
//            }
        }
    }
}

struct Result: Codable {
    let result: String?
}
