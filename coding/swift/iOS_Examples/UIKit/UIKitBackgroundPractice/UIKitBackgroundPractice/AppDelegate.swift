//
//  AppDelegate.swift
//  UIKitBackgroundPractice
//
//  Created by 문철현 on 2023/03/02.
//

import UIKit
import BackgroundTasks

class MyOperation: Operation {
    override func main() {
        print("is main thread? (\(Thread.isMainThread))")
        for i in 0...9 {
          print(i)
        }
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        BGTaskScheduler.shared.register(
                        forTaskWithIdentifier: "com.chmun.UIKitBackgroundPractice.refresh",
                        using: DispatchQueue.global()
        ) { task in
            self.handleAppRefresh(task)
        }
        return true
    }
    
    
    
    private func handleAppRefresh(_ task: BGTask) {
        // 다음 동작 수행, 반복시 필요
        scheduleAppRefresh()
        
        task.expirationHandler = {
            task.setTaskCompleted(success: false)
        }
        
        // 가벼운 백그라운드 작업 작성
        task.setTaskCompleted(success: true)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        scheduleAppRefresh()
    }

    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.chmun.UIKitBackgroundPractice.refresh")
        
        do {
            try BGTaskScheduler.shared.submit(request)
            request.earliestBeginDate = Date(timeIntervalSinceNow: 5)
            // Set a breakpoint in the code that executes after a successful call to submit(_:).
            print("hello")
        } catch {
            print("\(Date()): Could not schedule app refresh: \(error)")
        }
    }
    
   

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

