//
//  ContentView.swift
//  NavigationSplitView
//
//  Created by 문철현 on 2/20/24.
//

// StackOverflow 질문글의 코드
// https://stackoverflow.com/questions/78024060/swiftui-navigationsplitview-detail-view-not-getting-updated

import SwiftUI

struct ContentView: View {
  @StateObject var controller = DetailViewTestingController()
  
  var body: some View {
    NavigationSplitView {
      VStack {
        List(selection: $controller.selection) {
          ForEach(controller.listOfObjects, id: \.self.id) { _object in
            NavigationLink(value: _object.id) {
              Text(_object.title ?? "no title")
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.vertical)
          }
        }
      }
      .navigationSplitViewColumnWidth(240)
    } detail: {
      ZStack {
        VStack{
          if (controller.selection ?? -1 >= 0) {
            Text("Direct: \(controller.listOfObjects[controller.selection!].title ?? "none")")
            Text("Found: \(controller.detailObject.title ?? "none")")
            //DetailView(detailObject: $controller.detailObject)
            DetailView()
              .environmentObject(controller.detailObject)
          }
        }
      }
    }
  }
}

struct DetailView: View {
  @EnvironmentObject var detailObject: DetailObject
  
  var body: some View {
    Text("Object Title: \(detailObject.title ?? "none")")
  }
}

public class DetailObject : Identifiable, Hashable, ObservableObject {
  
  public var id: Int
  public var title : String?
  
  public init(id: Int, title: String? = nil) {
    self.id = id
    self.title = title
  }
  
  // MARK: Hashable Protocol
  
  open func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    hasher.combine(title)
  }
  
  public static func == (lhs: DetailObject, rhs: DetailObject) -> Bool {
    if (lhs.id == rhs.id) { return false }
    if (lhs.title == rhs.title) { return false }
    return true
  }
}

open class DetailViewTestingController : ObservableObject {
  @Published public var listOfObjects : [DetailObject] = []
  @Published public var detailObject : DetailObject = DetailObject(id: 0, title: "")
  @Published public var selection : Int? {
    didSet {
      detailObject = DetailObject(id: 0, title: "")
      if (selection == nil) { return }
      for d in listOfObjects {
        if (d.id == selection) {
          detailObject = d
          return
        }
      }
    }
  }
  
  public init() {
    listOfObjects.append(DetailObject(id: 0, title: "one"))
    listOfObjects.append(DetailObject(id: 1, title: "two"))
    listOfObjects.append(DetailObject(id: 2, title: "three"))
    listOfObjects.append(DetailObject(id: 3, title: "four"))
  }
}

#Preview {
  ContentView()
}
