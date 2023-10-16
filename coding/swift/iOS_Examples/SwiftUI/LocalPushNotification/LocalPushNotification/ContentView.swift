//
//  ContentView.swift
//  LocalPushNotification
//
//  Created by 문철현 on 2023/10/16.
//

import SwiftUI

struct ContentView: View {
  var userNotiCenter: UNUserNotificationCenter
  let notiContent: UNMutableNotificationContent
  
  @State var showAlert: Bool
  @State var directToSettings: Bool
  
  init() {
    userNotiCenter = UNUserNotificationCenter.current()
    notiContent = UNMutableNotificationContent()
    
    showAlert = false
    directToSettings = false
  }
  
  var body: some View {
    VStack {
      Button {
        // 3초뒤에 트리거되는 메시지 전송
        self.triggerPushMessage()
      } label: {
        Text("Execute Push message")
      }
    }
    .onAppear {
      // 권한 설정 상태 가져오기 & 권한 요청하기
      self.getPushNotiAuthorization()
      // 푸쉬 메시지 설정
      self.setPushMessage()
    }
    .alert(isPresented: $showAlert) {
      Alert(
        title: Text("알림 권한 요청"),
        message: Text("알림 권한이 반드시 필요함."),
        dismissButton: .default(Text("권한 설정으로 이동")) {
          directToSettings.toggle()
        }
      )
    }
    .onChange(of: directToSettings) { newValue in
      if newValue {
        DispatchQueue.main.async {
          openSettings()
        }
      }
    }
  }
  
  private func triggerPushMessage() {
    // Foreground 상태에서는 알람이 안보이므로, 3초 뒤에 표시되도록 설정.
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
    let request = UNNotificationRequest(
      identifier: "Notification",
      content: notiContent,
      trigger: trigger
    )
    
    userNotiCenter.add(request) { error in
      if let error = error {
        print(#function, error as Any)
      }
    }
  }
  
  private func getPushNotiAuthorization() {
    userNotiCenter.getNotificationSettings { settings in
      // 승인되어 있지 않은경우
      if settings.authorizationStatus != .authorized {
        // 권한 요청
        setPushNotiAuthorization()
      }
      
      // 거부되어 있는 경우
      if settings.authorizationStatus == .denied {
        showAlert.toggle()
      }
    }
  }
  
  private func setPushNotiAuthorization() {
    let notiAuthOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
    userNotiCenter.requestAuthorization(options: notiAuthOptions) { (success, error) in
      if let error = error {
        print(#function, error)
      }
    }
  }
  
  private func setPushMessage() {
    // Title & Message 내용 설정
    notiContent.title = "Title(test)"
    notiContent.body = "Body(test)"
    
    // User Info: 푸시 메시지에 담고싶은 정보를 [AnyHashable : Any] 타입으로 입력.
    notiContent.userInfo = ["category": "Tester", "count": 10]
    
    // 썸네일 설정
    do {
      let imageUrl = Bundle.main.url(forResource: "user", withExtension: "png")
      let attach = try UNNotificationAttachment(identifier: "Notification", url: imageUrl!, options: nil)
      notiContent.attachments.append(attach)
    } catch {
      print(error)
    }
    
    // 배지 설정 (0 이하는 배지 표시안함)
    let newNumber = UserDefaults.standard.integer(forKey: "NotiTestBadgeNumber") + 1
    UserDefaults.standard.set(newNumber, forKey: "NotiTestBadgeNumber")
    notiContent.badge = (newNumber) as NSNumber
  }
  
  // 설정 화면 Open
  private func openSettings() {
    if let settings = URL(string: UIApplication.openSettingsURLString) {
      if UIApplication.shared.canOpenURL(settings) {
        UIApplication.shared.open(settings)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
