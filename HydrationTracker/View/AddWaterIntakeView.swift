//
//  AddWaterIntakeView.swift
//  HydrationTracker
//
//  Created by Venkatesh Nyamagoudar on 3/18/24.
//

import SwiftUI

struct AddWaterIntakeView: View {
    @Binding var isPresented: Bool
    @Binding var numberOfGlasses: Int
    @Binding var waterIntakeEntries: [WaterIntakeEntry]
    private let formatter = DateFormatter()
    var updateCurrentHydration: (Int) -> Void
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Button(action: {
                        // Action to decrease the count
                        if numberOfGlasses > 0 {
                            numberOfGlasses -= 1
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
                        Text("\(numberOfGlasses)")
                            .font(.title)
                            .fontWeight(.bold)
                        Image(systemName: "drop")
                            .resizable()
                            .foregroundStyle(Color.blue.opacity(0.3))
                            .frame(width: 100,height: 150)
                    }
                    .padding(.vertical)
                    
                    Button(action: {
                        numberOfGlasses += 1
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
                
                Button(action: {
                    let timestamp = formatter.string(from: Date())
                    waterIntakeEntries.append(WaterIntakeEntry(amount: "\(numberOfGlasses)", timestamp: timestamp))
                    updateCurrentHydration(numberOfGlasses)
                    isPresented = false
                }) {
                    Text("Add")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding()
            .navigationTitle("Log Water intake")
        }
    }
}

#Preview {
    AddWaterIntakeView(isPresented: .constant(true), numberOfGlasses: .constant(0), waterIntakeEntries: .constant([])){_ in 
        
    }
}
