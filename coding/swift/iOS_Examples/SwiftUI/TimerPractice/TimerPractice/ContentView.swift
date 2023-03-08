//
//  ContentView.swift
//  TimerPractice
//
//  Created by 문철현 on 2023/03/08.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vpnTimer = VPNTimer()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Count : \(vpnTimer.count)")
        }
        .onAppear {
            vpnTimer.startTimer()
        }
    }
}

class VPNTimer: ObservableObject {
    private var vpnRefresher: Timer = Timer()
    
    @Published public var count: Int = 0
    
    public func startTimer() {
        vpnRefresher = Timer.scheduledTimer(timeInterval: 1,
                                            target: self,
                                            selector: #selector(addCount(sender:)),
                                            userInfo: nil,
                                            repeats: true)
        
    }
    
    public func stopTimer() {
        vpnRefresher.invalidate()
    }
    
    @objc private func addCount(sender: Timer) {
        count += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
