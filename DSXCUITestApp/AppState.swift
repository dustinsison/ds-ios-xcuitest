import SwiftUI

class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var notificationsEnabled: Bool = false

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
