//
//  NotiContentBuilder.swift
//  LocalPushNotification
//
//  Created by 문철현 on 2023/10/17.
//

import Foundation
import UserNotifications

// MARK: Entity builder
class NotiContentBuilder {
  let identifier: String
  
  init(identifier: String) {
    self.identifier = identifier
  }
  
  func build(content: NotiContent) -> UNMutableNotificationContent {
    let notiContent = UNMutableNotificationContent()
    
    notiContent.title = content.title
    notiContent.body = content.body ?? ""
    notiContent.userInfo = content.userInfo ?? [:]
    
    if let badgeKey = content.badgeKey {
      let newNumber = UserDefaults.standard.integer(forKey: badgeKey) + 1
      UserDefaults.standard.set(newNumber, forKey: badgeKey)
      notiContent.badge = newNumber as NSNumber
    }
    
    if let imageUrl = content.image {
      do {
        let attach = try UNNotificationAttachment(identifier: self.identifier, url: imageUrl)
        notiContent.attachments.append(attach)
      } catch {
        print("Thumbnail 설정 에러 : ", error)
      }
    }
    
    return notiContent
  }
}
