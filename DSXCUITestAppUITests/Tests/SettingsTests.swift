// SettingsTests.swift
// Verifies navigation to settings and settings state behavior.

import XCTest

final class SettingsTests: BaseUITest {
    func testNavigationToSettingsScreen() {
        let loginPage = LoginPage(app: app)
        let homePage = HomePage(app: app)
        let settingsPage = SettingsPage(app: app)

        loginPage
            .assertVisible()
            .login(
                email: TestUsers.validEmail,
                password: TestUsers.validPassword
            )

        homePage
            .assertVisible()
            .openSettings()

        settingsPage.assertVisible()
    }

    func testSettingsBackButtonReturnsToHomeScreen() {
        let loginPage = LoginPage(app: app)
        let homePage = HomePage(app: app)
        let settingsPage = SettingsPage(app: app)

        loginPage
            .assertVisible()
            .login(
                email: TestUsers.validEmail,
                password: TestUsers.validPassword
            )

        homePage
            .assertVisible()
            .openSettings()

        settingsPage
            .assertVisible()
            .goBack()

        homePage.assertVisible()
    }

    func testToggleStatePersistsDuringSession() {
        let loginPage = LoginPage(app: app)
        let homePage = HomePage(app: app)
        let settingsPage = SettingsPage(app: app)

        loginPage
            .assertVisible()
            .login(
                email: TestUsers.validEmail,
                password: TestUsers.validPassword
            )

        homePage
            .assertVisible()
            .openSettings()

        settingsPage
            .assertVisible()
            .setNotifications(enabled: true)
            .save()
            .goBack()

        homePage
            .assertVisible()
            .openSettings()

        settingsPage
            .assertVisible()
            .assertNotifications(enabled: true)
    }
}
