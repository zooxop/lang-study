//
//  ContentView.swift
//  NSViewRepresentableExample
//
//  Created by 문철현 on 2023/04/30.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            TableViewTest()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 400, height: 400)
    }
}


struct TableViewTest: NSViewRepresentable {
    typealias NSViewType = NSScrollView
    
    func makeNSView(context: Context) -> NSScrollView {
        let tableContainer = NSScrollView(frame: .zero)
        
        let tableView = NSTableView(frame: .zero)
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        
        tableView.rowHeight = 30.0
        tableView.gridStyleMask = [.solidVerticalGridLineMask, .solidHorizontalGridLineMask]
        
        let nameColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "Name"))
        nameColumn.title = "Name"
        tableView.addTableColumn(nameColumn)
        
        let ageColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "Age"))
        ageColumn.title = "Age"
        tableView.addTableColumn(ageColumn)
        
        
        tableContainer.documentView = tableView
        tableContainer.hasVerticalScroller = true
        
        return tableContainer
    }
    
    func updateNSView(_ nsView: NSScrollView, context: Context) {
        
        guard let tableView = nsView.documentView as? NSTableView else { return }
        tableView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}

extension TableViewTest {
    final class Coordinator: NSObject, NSTableViewDelegate, NSTableViewDataSource {
        
        func numberOfRows(in tableView: NSTableView) -> Int {
          return 15
        }
        
        func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
            switch tableColumn?.identifier.rawValue {
            case "Name":
                return "Person \(row)"
            case "Age":
                return "\(25 + row)"
            default:
                return nil
            }
        }
        
        func tableView(_ tableView: NSTableView, shouldEdit tableColumn: NSTableColumn?, row: Int) -> Bool {
          return true
        }
        
        func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
        }
    }
}
