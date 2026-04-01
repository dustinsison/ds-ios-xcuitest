// BaseUITest.swift
// Provides shared app launch and failure handling behavior for UI tests.

import XCTest

class BaseUITest: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launchForUITesting()
    }

    override func tearDownWithError() throws {
        if let testRun = self.testRun, !testRun.hasSucceeded {
            let screenshot = XCUIScreen.main.screenshot()
            let attachment = XCTAttachment(screenshot: screenshot)
            attachment.name = "\(name)-failure"
            attachment.lifetime = .keepAlways
            add(attachment)
        }

        app = nil
    }
}
