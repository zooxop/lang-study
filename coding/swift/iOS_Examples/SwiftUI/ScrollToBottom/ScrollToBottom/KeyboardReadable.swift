//
//  KeyboardReadable.swift
//  ScrollToBottom
//
//  Created by 문철현 on 2023/01/23.
//

// MARK: KeyboardReadable
// - keyboard가 표시되는 것을 감지. (only use on iOS)
import Combine
import UIKit

// Publisher to read keyboard changes.
protocol KeyboardReadable {
    var keyboardPublisher: AnyPublisher<Bool, Never> { get }
}

extension KeyboardReadable {
    var keyboardPublisher: AnyPublisher<Bool, Never> {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .map { _ in true },
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in false }
        )
        .eraseToAnyPublisher()
    }
}
