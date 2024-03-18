//
//  EditTargetView.swift
//  HydrationTracker
//
//  Created by Venkatesh Nyamagoudar on 3/18/24.
//

import SwiftUI

struct EditTargetView: View {
    @Binding var isPresented: Bool
    @StateObject var viewModel: HomeViewModel
    @State private var showAlert = false
    @State private var targetHydration = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Stepper("Target Hydration: \(targetHydration)", value: $targetHydration, in: 0...Int.max)
                    .padding()
                
                Button(action: {
                    viewModel.updateHydrationTarget(target: targetHydration)
                    isPresented = false
                }) {
                    Text("Save")
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
            .navigationTitle("Edit Hydration Target")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Cannot Set 0 Glasses as target", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
        }
        .onAppear {
            targetHydration = Int(viewModel.dailyHydration?.targetHydration ?? 0)
        }
    }
}

#Preview {
    EditTargetView(isPresented: .constant(true), viewModel: HomeViewModel())
}
