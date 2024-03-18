//
//  StatisticsView.swift
//  HydrationTracker
//
//  Created by Venkatesh Nyamagoudar on 3/17/24.
//

import SwiftUI

struct StatisticsView: View {
    @ObservedObject var viewModel: StatisticsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Text("Glasses Consumed Last 7 Days")
                        .font(.headline)
                    BarGraphView(dataPoints: viewModel.last7DaysData)
                        .frame(height: 200)
                }
                
                VStack(spacing: 10) {
                    Text("Glasses Consumed Last 30 Days")
                        .font(.headline)
                    BarGraphView(dataPoints: viewModel.last30DaysData)
                        .frame(height: 200)
                }
                
                VStack(spacing: 10) {
                    Text("Statistics")
                        .font(.headline)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Average Glasses Consumed")
                            Text("Max Glasses Consumed")
                            Text("Days Completed Target")
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 5) {
                            Text("\(viewModel.averageGlasses)")
                            Text("\(viewModel.maxGlasses)")
                            Text("\(viewModel.daysCompletedTarget)")
                        }
                    }
                }
            }
            .padding()
        }
        .navigationBarTitle("Statistics")
        .onAppear {
            viewModel.fetchStatistics()
        }
    }
}

#Preview {
    StatisticsView()
}
