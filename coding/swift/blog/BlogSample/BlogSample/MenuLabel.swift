//
//  MenuLabel.swift
//  BlogSample
//
//  Created by 문철현 on 2022/10/04.
//

import UIKit

class MenuLabel: UILabel {

    override var canBecomeFirstResponder: Bool {
        return true
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        isUserInteractionEnabled = true
        addGestureRecognizer(
            UILongPressGestureRecognizer(
                target: self,
                action: #selector(handleLongPressed(_:))
            )
        )
    }

    // MARK: - Actions

    @objc func handleLongPressed(_ gesture: UILongPressGestureRecognizer) {
        guard let gestureView = gesture.view, let superView = gestureView.superview else {
            return
        }

        let menuController = UIMenuController.shared

        guard !menuController.isMenuVisible, gestureView.canBecomeFirstResponder else {
            return
        }

        gestureView.becomeFirstResponder()

        menuController.menuItems = [
            UIMenuItem(
                title: "Custom Item",
                action: #selector(handleCustomAction(_:))
            ),
            UIMenuItem(
                title: "Copy",
                action: #selector(handleCopyAction(_:))
            )
        ]

        menuController.setTargetRect(gestureView.frame, in: superView)
        menuController.setMenuVisible(true, animated: true)
    }

    @objc func handleCustomAction(_ controller: UIMenuController) {
        print("Custom action!")
    }

    @objc func handleCopyAction(_ controller: UIMenuController) {
        UIPasteboard.general.string = text ?? ""
    }

}
