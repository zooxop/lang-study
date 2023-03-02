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
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        let appRefreshOperation = MyOperation()
        queue.addOperation(appRefreshOperation)

        task.expirationHandler = {
            queue.cancelAllOperations()
        }

        let lastOperation = queue.operations.last
        lastOperation?.completionBlock = {
            task.setTaskCompleted(success: !(lastOperation?.isCancelled ?? false))
        }

        scheduleAppRefresh()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        scheduleAppRefresh()
    }

    private func scheduleAppRefresh() {
        do {
            let request = BGAppRefreshTaskRequest(identifier: "com.chmun.UIKitBackgroundPractice.refresh")
            request.earliestBeginDate = Date(timeIntervalSinceNow: 3600)
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print(error)
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

