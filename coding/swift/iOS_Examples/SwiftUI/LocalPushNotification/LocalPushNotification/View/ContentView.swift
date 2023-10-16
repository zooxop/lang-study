//
//  ContentView.swift
//  LocalPushNotification
//
//  Created by 문철현 on 2023/10/16.
//

import SwiftUI

struct ContentView: View {
  typealias ViewModel = ContentViewModel
  @StateObject var viewModel: ViewModel
  
  init(viewModel: ViewModel = .init()) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    VStack {
      Button {
        // 3초뒤에 트리거되는 메시지 전송
        self.viewModel.triggerNotification(timeInterval: 3, repeats: false)
      } label: {
        Text("Execute Push message")
      }
    }
    .onAppear {
      // 권한 설정 상태 가져오기 & 권한 요청하기
      self.viewModel.checkAndRequestAuth()
      // 푸쉬 메시지 설정
      self.viewModel.setPushMessage()
    }
    .alert(isPresented: $viewModel.showAlert) {
      authAlert()
    }
    .onChange(of: viewModel.directToSettingsApp) { newValue in
      if newValue {
        DispatchQueue.main.async {
          openSettings()
        }
      }
    }
  }
  
  func authAlert() -> Alert {
    return Alert(
      title: Text("알림 권한 요청"),
      message: Text("알림 권한이 반드시 필요함."),
      dismissButton: .default(Text("권한 설정으로 이동")) {
        viewModel.directToSettingsApp.toggle()
      }
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
