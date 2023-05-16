//
//  Custom.swift
//  SOFNavigationToolBar
//
//  Created by 문철현 on 2023/05/16.
//

import SwiftUI
import Foundation

public enum GPToolbarItem {
    case logo(_ didTap: (() -> Void)? = nil)
    case magnifyingGlass(_ didTap: (() -> Void)? = nil)
    case chevronLeft(_ didTap: (() -> Void)? = nil)
    case heart(_ didTap: (() -> Void)? = nil)
    case text(_ didTap: (() -> Void)? = nil)
}

extension GPToolbarItem: Identifiable {
    public var id: UUID { .init() }
}

public extension View {
    func gpNavigationTitle(_ title: Text) -> some View {
        return modifier(GPNavigationTitleModifier(title: title))
    }
    
    func gpToolbarItem(leftItems: [GPToolbarItem], rightItems: [GPToolbarItem]) -> some View {
        return modifier(GPToolbarItemModifier(leftItems: leftItems, rightItems: rightItems))
    }
}

struct GPToolbarItemModifier: ViewModifier {
    private let leftItems: [GPToolbarItem]
    private let rightItems: [GPToolbarItem]
    
    init(leftItems: [GPToolbarItem], rightItems: [GPToolbarItem]) {
        self.leftItems = leftItems
        self.rightItems = rightItems
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    ItemBuilder(items: self.leftItems)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    ItemBuilder(items: self.rightItems)
                }
            }
    }
    
    @ViewBuilder
    private func ItemBuilder(items: [GPToolbarItem]) -> some View {
        ForEach(items) {
            switch $0 {
            case let .logo(tapGesture):
                Button("logo") {
                    tapGesture?()
                }
            case let .magnifyingGlass(tapGesture):
                Button("magnifyingGlass") {
                    tapGesture?()
                }
            case let .chevronLeft(tapGesture):
                Button("chevronLeft") {
                    tapGesture?()
                }
            case let .heart(tapGesture):
                Button("heart") {
                    tapGesture?()
                }
            case let .text(tapGesture):
                Button("text") {
                    tapGesture?()
                }
            }
        }
    }
}

struct GPNavigationTitleModifier: ViewModifier {
    private let title: Text
    
    init(title: Text) { self.title = title }
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.automatic)
            .navigationTitle(self.title)
    }
}
