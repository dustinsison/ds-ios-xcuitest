// DSXCUITestApp.swift
// App entry point that provides shared AppState and root navigation.

import SwiftUI

@main
struct DSXCUITestApp: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if appState.isLoggedIn {
                    HomeView()
                } else {
                    LoginView()
                }
            }
            .environmentObject(appState)
        }
    }
}
