//
//  HyderationNotificationView.swift
//  HydrationTracker
//
//  Created by Venkatesh Nyamagoudar on 3/18/24.
//

import SwiftUI

struct HyderationNotificationView: View {
    @AppStorage("notificationInterval") private var notificationInterval = 45
    
    var body: some View {
        Form {
            Section(header: Text("Notification Interval")) {
                Stepper(value: $notificationInterval, in: 15...120, step: 15) {
                    Text("\(notificationInterval) minutes")
                }
                .onChange(of: notificationInterval) { newValue in
                    saveNotificationInterval(newValue)
                    NotificationManager.shared.scheduleIntervalNotification(interval: TimeInterval(newValue * 60))
                }
            }
        }
        .navigationTitle("Notification Settings")
        .onAppear {
            NotificationManager.shared.scheduleIntervalNotification(interval: TimeInterval(notificationInterval * 60))
        }
    }
    
    private func saveNotificationInterval(_ interval: Int) {
        notificationInterval = interval
    }
}

#Preview {
    HyderationNotificationView()
}
