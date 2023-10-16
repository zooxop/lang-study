//
//  ContentViewModel.swift
//  LocalPushNotification
//
//  Created by 문철현 on 2023/10/16.
//

import SwiftUI

class ContentViewModel: ObservableObject {
  
  let notiService: NotiCenterService
  var notiContent: NotiContent?
  
  @Published var showAlert: Bool
  @Published var directToSettingsApp: Bool
  
  init(
    notiService: NotiCenterService = NotiCenterService(identifier: "Notification")
  ) {
    self.notiService = notiService
    
    self.showAlert = false
    self.directToSettingsApp = false
  }
  
  /// 권한 상태를 확인 & 요청
  func checkAndRequestAuth() {
    notiService.getPushNotiAuthorization { status in
      if status == .denied {
        DispatchQueue.main.async {
          self.showAlert.toggle()
        }
      }
    }
  }
  
  /// Notification trigger
  func triggerNotification(
    timeInterval: TimeInterval,
    repeats: Bool
  ) {
    guard let content = self.notiContent else { return }
    
    let builder = NotiContentBuilder(identifier: notiService.identifier)
    let requestContent = builder.build(content: content)
    
    notiService.trigger(requestContent, timeInterval: timeInterval, repeats: repeats)
  }
  
  func setPushMessage() {
    // Title & Message 내용 설정
    self.notiContent = NotiContent(title: "Title(test)")
    notiContent!.body = "Body(test)"
    notiContent!.userInfo = ["category": "Tester", "count": 10]
    notiContent!.image = Bundle.main.url(forResource: "user", withExtension: "png")
    notiContent!.badgeKey = "NotiTestBadgeNumber"
  }
  
}
