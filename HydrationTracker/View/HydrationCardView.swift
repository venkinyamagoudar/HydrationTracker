//
//  HydrationCardView.swift
//  HydrationTracker
//
//  Created by Venkatesh Nyamagoudar on 3/18/24.
//

import SwiftUI

struct HydrationCardView: View {
    let cardType: CardType
    let amount: String // Assuming the amount is provided as a String
    
    var body: some View {
        let backgroundColor: Color = cardType == .hydrationTarget ? Color.blue.opacity(0.3) : Color.yellow.opacity(0.3)
        
        return VStack(alignment: .leading) {
            HStack {
                Text(cardType == .hydrationTarget ? "Hydration Target" : "Current Hydration")
                    .font(.caption)
                Spacer()
                if cardType == .hydrationTarget {
                    Button(action: {
                        // Action when the button is tapped
                    }) {
                        Text("Edit")
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.white)
                    .cornerRadius(30)
                }
            }
            Spacer()
            Text(amount)
                .font(.title)
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

#Preview {
    HydrationCardView(cardType: .hydrationTarget, amount: "700")
}
