// HomePage.swift
// Encapsulates interactions and assertions for the home screen.

import XCTest

struct HomePage {
    let app: XCUIApplication

    private var welcomeLabel: XCUIElement { app.staticTexts["home.welcomeLabel"] }
    private var settingsButton: XCUIElement { app.buttons["home.settingsButton"] }
    private var logoutButton: XCUIElement { app.buttons["home.logoutButton"] }

    @discardableResult
    func assertVisible(timeout: TimeInterval = 5) -> Self {
        XCTAssertTrue(welcomeLabel.waitForExistence(timeout: timeout), "Expected home welcome label to be visible.")
        XCTAssertTrue(settingsButton.waitForExistence(timeout: timeout), "Expected home settings button to be visible.")
        XCTAssertTrue(logoutButton.waitForExistence(timeout: timeout), "Expected home logout button to be visible.")
        return self
    }

    @discardableResult
    func openSettings() -> Self {
        XCTAssertTrue(settingsButton.waitForExistence(timeout: 5), "Expected home settings button to exist before tapping.")
        settingsButton.tap()
        return self
    }

    @discardableResult
    func logout() -> Self {
        XCTAssertTrue(logoutButton.waitForExistence(timeout: 5), "Expected home logout button to exist before tapping.")
        logoutButton.tap()
        return self
    }
}
