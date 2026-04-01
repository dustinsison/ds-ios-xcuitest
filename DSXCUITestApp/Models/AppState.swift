// AppState.swift
// Stores shared application state for authentication and settings.

import SwiftUI

final class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var notificationsEnabled: Bool = false {
        didSet {
            print("DEBUG notificationsEnabled changed to: \(notificationsEnabled)")
        }
    }

    init() {
        print("DEBUG AppState init: \(ObjectIdentifier(self))")
    }

    func login(email: String, password: String) -> Bool {
        if email == "qa@example.com" && password == "Password123" {
            isLoggedIn = true
            return true
        }
        return false
    }

    func logout() {
        isLoggedIn = false
    }
}
