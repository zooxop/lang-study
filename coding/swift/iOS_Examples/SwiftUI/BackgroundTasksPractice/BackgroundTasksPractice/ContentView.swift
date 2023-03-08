//
//  ContentView.swift
//  BackgroundTasksPractice
//
//  Created by 문철현 on 2023/03/08.
//

import SwiftUI
import BackgroundTasks

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        VStack {
            Text("Count : \(BackgroundCounter.shared.count)")
            
            Button("print count") {
                print(BackgroundCounter.shared.count)
            }
        }
//        .onAppear {
//            submitBackgroundTask()
//        }
        .onChange(of: scenePhase) { newValue in
            if newValue == .background {
                submitBackgroundTask()
            }
        }
    }
    
    func submitBackgroundTask() {
        do {
            let identifier = "com.chmun.BackgroundTasksPractice.refresh"
            let request = BGAppRefreshTaskRequest(identifier: identifier)
            request.earliestBeginDate = Date(timeIntervalSinceNow: 1) // 3초
            try BGTaskScheduler.shared.submit(request)
            print("")  // Break Point 걸려고 임시로 써놓은 print문
        } catch {
            print("Error registering background task: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class BackgroundCounter : ObservableObject {
    public static let shared = BackgroundCounter()
    
    @Published public var count: Int = 0
}
