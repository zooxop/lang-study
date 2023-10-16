//
//  NotiCenterService.swift
//  LocalPushNotification
//
//  Created by 문철현 on 2023/10/16.
//

import Foundation
import UserNotifications

// MARK: Service
class NotiCenterService {
  let identifier: String
  var userNotiCenter: UNUserNotificationCenter
  
  init(identifier: String) {
    self.identifier = identifier
    self.userNotiCenter = UNUserNotificationCenter.current()
  }
  
  /// Notification Trigger
  func trigger(
    _ notiContent: UNMutableNotificationContent,
    timeInterval: TimeInterval,
    repeats: Bool
  ) {
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: repeats)
    let request = UNNotificationRequest(
      identifier: self.identifier,
      content: notiContent,
      trigger: trigger
    )
    
    userNotiCenter.add(request) { error in
      if let error = error {
        print(#function, error as Any)
      }
    }
  }
  
  /// 현재 권한 허용 상태 불러오기 (최초 실행의 경우는 권한 요청 Alert을 표시함.)
  func getPushNotiAuthorization(completion: @escaping (UNAuthorizationStatus) -> Void) {
    userNotiCenter.getNotificationSettings { settings in
      // 승인되어 있지 않은경우
      if settings.authorizationStatus != .authorized {
        // 권한 요청
        self.requestNotiAuthorization()
      }
      
      completion(settings.authorizationStatus)
    }
  }
  
  /// 권한 요청 alert을 표시한다.
  private func requestNotiAuthorization() {
    let notiAuthOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
    userNotiCenter.requestAuthorization(options: notiAuthOptions) { (success, error) in
      if let error = error {
        print(#function, error)
      }
    }
  }
}
