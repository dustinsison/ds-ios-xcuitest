// XCUIElement+Typing.swift
// Adds reusable text clearing and typing behavior for UI elements.

import XCTest

extension XCUIElement {
    func clearAndTypeText(_ text: String) {
        tap()

        guard let currentValue = value as? String, !currentValue.isEmpty else {
            typeText(text)
            return
        }

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentValue.count)
        typeText(deleteString)
        typeText(text)
    }
}
