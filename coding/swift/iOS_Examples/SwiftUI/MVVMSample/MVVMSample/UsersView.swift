//
//  UsersView.swift
//  MVVMSample
//
//  Created by 문철현 on 2023/01/05.
//

import SwiftUI

struct UsersView: View {
  @StateObject var viewModel: ViewModel
  
  init(viewModel: ViewModel = .init()) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    List(viewModel.users) { user in
      Text(user.name)
    }
    .onAppear {
      viewModel.getUsers()
    }
  }
}

extension UsersView {
  class ViewModel: ObservableObject {
    @Published var users = [User]()
    
    let dataService: DataService
    
    init(dataService: DataService = AppDataService()) {
      self.dataService = dataService
    }
    
    func configure(with somting: Any) {
      
    }
    
    func getUsers() {
      dataService.getUsers { [weak self] users in
        self?.users = users
      }
    }
  }
}

struct UsersView_Previews: PreviewProvider {
  static var previews: some View {
    let user = User(id: 0, name: "Dummy")
    let viewModel = UsersView.ViewModel()
    viewModel.users = [user]
    
    return UsersView(viewModel: viewModel)
  }
}
