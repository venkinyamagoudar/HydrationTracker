//
//  EditTargetView.swift
//  HydrationTracker
//
//  Created by Venkatesh Nyamagoudar on 3/18/24.
//

import SwiftUI

struct EditTargetView: View {
    @Binding var targetAmount: Int
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Button(action: {
                        // Action to decrease the count
                        if targetAmount > 0 {
                            targetAmount -= 1
                        }
                    }) {
                        Image(systemName: "minus")
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                    }
                    .background(Color.blue)
                    .cornerRadius(35)
                    .padding()
                    ZStack {
                        Text("\(targetAmount)")
                            .font(.title)
                            .fontWeight(.bold)
                        Image(systemName: "drop")
                            .resizable()
                            .foregroundStyle(Color.blue.opacity(0.3))
                            .frame(width: 150,height: 200)
                    }
                    .padding(.vertical)
                    
                    Button(action: {
                        targetAmount += 1
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                    }
                    .background(Color.blue)
                    .cornerRadius(35)
                    .padding()
                }
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding()
            .navigationTitle("Edit Hydration Target")
        }
    }
}

#Preview {
    EditTargetView(targetAmount: .constant(20))
}
