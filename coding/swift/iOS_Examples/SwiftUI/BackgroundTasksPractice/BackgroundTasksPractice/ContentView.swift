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
    @State var count: Int = 0
    @StateObject var counterInterval = CounterInterval()
    
    var body: some View {
        VStack {
            VStack {
                Text("Count : \(BackgroundCounter.shared.count)")
                
                Button("print count") {
                    print(BackgroundCounter.shared.count)
                }
                Button("Start") {
                    counterInterval.startUpdating()
                }.padding()
                Button("Stop") {
                    counterInterval.stopUpdating()
                }.padding()
                
                Text("\(counterInterval.count)")
                    .padding()
            }
            .padding()
            
            VStack {
                Button("Start BackgroundTask") {
                    Task {
                        try await threadTest()
                    }
                }
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
            request.earliestBeginDate = Date(timeIntervalSinceNow: 3) // 3초
            try BGTaskScheduler.shared.submit(request)
            print("")  // Break Point 걸려고 임시로 써놓은 print문
        } catch {
            print("Error registering background task: \(error.localizedDescription)")
        }
    }
    
    func threadTest() async throws {
        for i in 0..<10 {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("\(i)")
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

class CounterInterval: ObservableObject {
    @Published var count: Int = 0
    private var timer: Timer? {  // Configuration refresh timer
        didSet(oldValue) {
            oldValue?.invalidate()
        }
    }
    
    // MARK: - VPN Configuration refresh
    func startUpdating() {
        let timer = Timer(timeInterval: 1 /*second*/, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.count += 1
            print(count)
        }
        RunLoop.main.add(timer, forMode: .common)
        self.timer = timer
    }
    
    func stopUpdating() {
        self.timer?.invalidate()
    }
}
