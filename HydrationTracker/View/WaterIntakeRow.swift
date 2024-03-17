//
//  WaterIntakeRow.swift
//  HydrationTracker
//
//  Created by Venkatesh Nyamagoudar on 3/18/24.
//

import SwiftUI

struct WaterIntakeRow: View {
    let amount: String
    let timestamp: String

    var body: some View {
        HStack {
            Image(systemName: "drop.fill")
                .foregroundColor(.blue)
                .font(.system(size: 24))
                .padding(.trailing, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Amount")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("\(amount) glasses")
                    .font(.headline)
            }
            Spacer()
            Image(systemName: "clock.fill")
                .foregroundColor(.green)
                .font(.system(size: 24))
                .padding(.trailing, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Time")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(formatTimestamp(timestamp))
                    .font(.subheadline)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
    
    private func formatTimestamp(_ timestamp: String) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
            if let date = formatter.date(from: timestamp) {
                formatter.dateFormat = "MMM dd, yyyy hh:mm a"
                return formatter.string(from: date)
            }
            return timestamp
        }
}

#Preview {
    WaterIntakeRow(amount: "100", timestamp: "12-11-2024")
}
