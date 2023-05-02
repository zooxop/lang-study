//
//  CodeBackup.swift
//  NSViewRepresentableExample
//
//  Created by 문철현 on 2023/05/02.
//

import SwiftUI

struct TableView: NSViewRepresentable {
    
    @Binding var items: [String]
    
    func makeNSView(context: Context) -> NSTableView {
        let tableView = NSTableView()
        
        let tableColumn = NSTableColumn()
        tableColumn.title = "col-1"
        
        let tableColumn2 = NSTableColumn()
        tableColumn.title = "col-2"

        tableView.addTableColumn(tableColumn)
        tableView.addTableColumn(tableColumn2)
        
        tableView.columnAutoresizingStyle = .uniformColumnAutoresizingStyle
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator
        
        return tableView
    }
    
    func updateNSView(_ nsView: NSTableView, context: Context) {
        nsView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, NSTableViewDataSource, NSTableViewDelegate {
        let parent: TableView
        
        init(_ parent: TableView) {
            self.parent = parent
        }
        
        func numberOfRows(in tableView: NSTableView) -> Int {
//            return parent.items.count
            return 100
        }
        
        func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//            let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "cell"), owner: self) as? NSTableCellView
//            cell?.textField?.stringValue = parent.items[row]
            let text = NSTextField()
            text.stringValue = "Hello World"
            let cell = NSTableCellView()
            cell.addSubview(text)
            text.drawsBackground = false
            text.isBordered = false
            text.translatesAutoresizingMaskIntoConstraints = false
            cell.addConstraint(NSLayoutConstraint(item: text, attribute: .centerY, relatedBy: .equal, toItem: cell, attribute: .centerY, multiplier: 1, constant: 0))
            cell.addConstraint(NSLayoutConstraint(item: text, attribute: .left, relatedBy: .equal, toItem: cell, attribute: .left, multiplier: 1, constant: 13))
            cell.addConstraint(NSLayoutConstraint(item: text, attribute: .right, relatedBy: .equal, toItem: cell, attribute: .right, multiplier: 1, constant: -13))
            return cell
        }
        
        func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
            let rowView = NSTableRowView()
            rowView.isEmphasized = false
            return rowView
        }
        
        func tableViewSelectionDidChange(_ notification: Notification) {
            guard let tableView = notification.object as? NSTableView else {
                return
            }
            let selectedRow = tableView.selectedRow
            print("Selected row: \(selectedRow)")
        }
    }
}
