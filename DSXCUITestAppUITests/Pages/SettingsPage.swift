// SettingsPage.swift
// Encapsulates interactions and assertions for the settings screen.

import XCTest

struct SettingsPage {
    let app: XCUIApplication

    private var toggleRow: XCUIElement { app.buttons["settings.toggleRow"] }
    private var saveButton: XCUIElement { app.buttons["settings.saveButton"] }
    private var backButton: XCUIElement { app.buttons["settings.backButton"] }
    private var savedLabel: XCUIElement { app.staticTexts["settings.savedLabel"] }

    @discardableResult
    func assertVisible(timeout: TimeInterval = 5) -> Self {
        XCTAssertTrue(toggleRow.waitForExistence(timeout: timeout), "Expected settings toggle row to be visible.")
        XCTAssertTrue(saveButton.waitForExistence(timeout: timeout), "Expected settings save button to be visible.")
        XCTAssertTrue(backButton.waitForExistence(timeout: timeout), "Expected settings back button to be visible.")
        return self
    }

    private func isToggleEnabled() -> Bool {
        let value = toggleRow.value as? String ?? ""
        return value.lowercased() == "on"
    }

    @discardableResult
    func setNotifications(enabled: Bool) -> Self {
        XCTAssertTrue(toggleRow.waitForExistence(timeout: 5), "Expected settings toggle row to exist before interaction.")

        if isToggleEnabled() != enabled {
            toggleRow.tap()
        }

        XCTAssertEqual(
            isToggleEnabled(),
            enabled,
            "Expected settings toggle state to be \(enabled ? "On" : "Off"), but got \(String(describing: toggleRow.value))."
        )

        return self
    }

    @discardableResult
    func assertNotifications(enabled: Bool) -> Self {
        XCTAssertTrue(toggleRow.waitForExistence(timeout: 5), "Expected settings toggle row to exist for assertion.")

        XCTAssertEqual(
            isToggleEnabled(),
            enabled,
            "Expected settings toggle enabled state to be \(enabled), but got value \(String(describing: toggleRow.value))."
        )

        return self
    }

    @discardableResult
    func save() -> Self {
        XCTAssertTrue(saveButton.waitForExistence(timeout: 5), "Expected settings save button to exist before tapping.")
        saveButton.tap()
        XCTAssertTrue(savedLabel.waitForExistence(timeout: 5), "Expected saved confirmation label to appear after saving settings.")
        return self
    }

    @discardableResult
    func goBack() -> Self {
        XCTAssertTrue(backButton.waitForExistence(timeout: 5), "Expected settings back button to exist before tapping.")
        backButton.tap()
        return self
    }
}
