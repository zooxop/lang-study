//
//  View+openSettingsApp.swift
//  LocalPushNotification
//
//  Created by 문철현 on 2023/10/17.
//

import SwiftUI

extension View {
  // 설정 화면 Open
  func openSettings() {
    if let settings = URL(string: UIApplication.openSettingsURLString) {
      if UIApplication.shared.canOpenURL(settings) {
        UIApplication.shared.open(settings)
      }
    }
  }
}
