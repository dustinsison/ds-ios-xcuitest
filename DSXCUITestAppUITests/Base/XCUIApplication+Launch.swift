// XCUIApplication+Launch.swift
// Provides a consistent launch configuration for UI tests.

import XCTest

extension XCUIApplication {
    func launchForUITesting() {
        launchArguments = [
            "--uitesting",
            "--reset-state"
        ]

        launchEnvironment = [
            "UI_TEST_MODE": "true"
        ]

        launch()
    }
}
