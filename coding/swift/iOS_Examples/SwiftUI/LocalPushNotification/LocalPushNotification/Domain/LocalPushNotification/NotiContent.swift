//
//  NotiContent.swift
//  LocalPushNotification
//
//  Created by 문철현 on 2023/10/16.
//

import Foundation

// MARK: Entity
struct NotiContent {
  var title: String
  var body: String?
  var userInfo: [String: Any]?
  var image: URL?
  var badgeKey: String?
}
