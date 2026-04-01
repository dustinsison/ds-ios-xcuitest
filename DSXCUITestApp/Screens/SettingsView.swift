// SettingsView.swift
// Displays session-scoped settings using shared AppState.

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) private var dismiss
    @State private var saved: Bool = false

    var body: some View {
        VStack(spacing: 24) {
            Button(action: {
                appState.notificationsEnabled.toggle()
            }) {
                HStack {
                    Text("Enable Notifications")
                        .foregroundColor(.primary)

                    Spacer()

                    Image(systemName: appState.notificationsEnabled ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(appState.notificationsEnabled ? .green : .gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            .buttonStyle(.plain)
            .accessibilityIdentifier("settings.toggleRow")
            .accessibilityLabel("Enable Notifications")
            .accessibilityValue(appState.notificationsEnabled ? "On" : "Off")

            Text(appState.notificationsEnabled ? "On" : "Off")
                .font(.caption2)
                .foregroundColor(.clear)
                .frame(height: 1)
                .accessibilityIdentifier("settings.toggleStateLabel")

            if saved {
                Text("Settings saved!")
                    .foregroundColor(.green)
                    .accessibilityIdentifier("settings.savedLabel")
            }

            Button(action: saveSettings) {
                Text("Save")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .accessibilityIdentifier("settings.saveButton")

            Button(action: { dismiss() }) {
                Text("Back")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .accessibilityIdentifier("settings.backButton")

            Spacer()
        }
        .padding(.horizontal, 32)
        .padding(.top, 24)
        .navigationTitle("Settings")
        .navigationBarBackButtonHidden(true)
        .onAppear {
            saved = false
        }
    }

    private func saveSettings() {
        saved = true
    }
}
