//
//  ContentView.swift
//  TimerPractice
//
//  Created by 문철현 on 2023/03/08.
//

import SwiftUI
import BackgroundTasks

struct ContentView: View {
    // @Environment(\.scenePhase) private var scenePhase
    
    @ObservedObject var vpnTimer = VPNTimer.shared
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Count : \(vpnTimer.count)")
            
            Button("Action") {
                vpnTimer.startBackgroundTask()
            }
        }
        .onAppear {
            // vpnTimer.startTimer()
        }
//        .onChange(of: scenePhase) { newValue in
//            if newValue == .background {
//                submitBackgroundTask()
//            } else {
//                if vpnTimer.state == true {
//                    // vpnTimer.stopTimer()
//                }
//            }
//        }
    }
    
    func submitBackgroundTask() {
        do {
            let identifier = "com.chmun.TimerPractice.bgtask"
            let request = BGAppRefreshTaskRequest(identifier: identifier)
            request.earliestBeginDate = .now.addingTimeInterval(24 * 3600)
            try BGTaskScheduler.shared.submit(request)
            print("")  // Break Point 걸려고 임시로 써놓은 print문
        } catch {
            print("Error registering background task: \(error.localizedDescription)")
        }
    }
}

class VPNTimer: ObservableObject {
    static public var shared = VPNTimer()
    
    private var vpnRefresher: Timer = Timer()
    
    public var state: Bool = false
    @Published public var count: Int = 0
    
    public func startTimer() {
        vpnRefresher = Timer.scheduledTimer(timeInterval: 1,
                                            target: self,
                                            selector: #selector(addCount(sender:)),
                                            userInfo: nil,
                                            repeats: true)
        
        state = true
    }
    
    public func stopTimer() {
        vpnRefresher.invalidate()
        state = false
    }
    
    @objc private func addCount(sender: Timer) {
        count += 1
        print("Count : \(count)")
    }
    
    func startBackgroundTask() {
        var backgroundTask: UIBackgroundTaskIdentifier = .invalid // Declare backgroundTask outside the closure
            
        backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "BackgroundTask") {
            // Background task completion handler
            UIApplication.shared.endBackgroundTask(backgroundTask)
        }
        
        DispatchQueue.global().async {
            // Perform your task within the background queue
            // For example, executing the VPN connection process
            if self.state {
                self.stopTimer()
            } else {
                self.startTimer()
            }
            DispatchQueue.main.async {
                UIApplication.shared.endBackgroundTask(backgroundTask) // Notify the system that the task is completed
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
