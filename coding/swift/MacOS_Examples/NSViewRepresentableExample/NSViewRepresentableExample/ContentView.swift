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
        
        tableView.gridStyleMask = [.solidVerticalGridLineMask]
        tableView.style = .fullWidth
        tableView.autoresizesSubviews = true
        tableView.columnAutoresizingStyle = .uniformColumnAutoresizingStyle
        tableView.usesAlternatingRowBackgroundColors = true
        
        tableView.allowsEmptySelection = true
        tableView.allowsTypeSelect = true
        tableView.allowsMultipleSelection = false
        tableView.allowsColumnSelection = false
        
        let nameColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "Name"))
        nameColumn.title = "Name"
        tableView.addTableColumn(nameColumn)
        
        let ageColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "Age"))
        ageColumn.title = "Age"
        tableView.addTableColumn(ageColumn)
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        tableView.tableColumns.forEach { (column) in
            column.headerCell.attributedStringValue = NSAttributedString(string: column.title, attributes: [NSAttributedString.Key.font: NSFont.systemFont(ofSize: 14, weight: .semibold), NSAttributedString.Key.paragraphStyle: paragraph])
        }
        
        tableContainer.documentView = tableView
        tableContainer.hasVerticalScroller = true
        tableContainer.autohidesScrollers = true
        
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
        
        func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
            let text = NSTextField()
            switch tableColumn?.identifier.rawValue {
            case "Name":
                text.stringValue = "Person \(row)"
            case "Age":
                text.stringValue = "\(25 + row)"
            default:
                break
            }
            text.alignment = .center
            text.drawsBackground = false
            text.isEditable = false
            text.isBordered = false
            text.font = NSFont.systemFont(ofSize: 13, weight: .regular)
            
            let cell = NSTableCellView()
            cell.addSubview(text)
            
            text.translatesAutoresizingMaskIntoConstraints = false
            cell.addConstraint(NSLayoutConstraint(item: text, attribute: .centerY, relatedBy: .equal, toItem: cell, attribute: .centerY, multiplier: 1, constant: 0))
            cell.addConstraint(NSLayoutConstraint(item: text, attribute: .left, relatedBy: .equal, toItem: cell, attribute: .left, multiplier: 1, constant: 0))
            cell.addConstraint(NSLayoutConstraint(item: text, attribute: .right, relatedBy: .equal, toItem: cell, attribute: .right, multiplier: 1, constant: 0))
            return cell
        }
        
        func tableView(_ tableView: NSTableView, shouldEdit tableColumn: NSTableColumn?, row: Int) -> Bool {
          return true
        }
        
        func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
        }
        
        func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
            return 30.0
        }
    }
}
