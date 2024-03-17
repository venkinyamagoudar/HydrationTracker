//
//  HomeView.swift
//  HydrationTracker
//
//  Created by Venkatesh Nyamagoudar on 3/17/24.
//

import SwiftUI

struct HomeView: View {
    @State var isShowingAddView: Bool = true
    
    let waterIntakeEntries = [
        WaterIntakeEntry(amount: "8 oz", timestamp: "Today, 10:00 AM"),
        WaterIntakeEntry(amount: "12 oz", timestamp: "Today, 12:30 PM"),
        WaterIntakeEntry(amount: "16 oz", timestamp: "Today, 3:45 PM"),
        WaterIntakeEntry(amount: "8 oz", timestamp: "Today, 10:00 AM"),
        WaterIntakeEntry(amount: "12 oz", timestamp: "Today, 12:30 PM"),
        WaterIntakeEntry(amount: "16 oz", timestamp: "Today, 3:45 PM"),
        WaterIntakeEntry(amount: "8 oz", timestamp: "Today, 10:00 AM"),
        WaterIntakeEntry(amount: "12 oz", timestamp: "Today, 12:30 PM"),
        WaterIntakeEntry(amount: "16 oz", timestamp: "Today, 3:45 PM"),
        WaterIntakeEntry(amount: "8 oz", timestamp: "Today, 10:00 AM"),
        WaterIntakeEntry(amount: "12 oz", timestamp: "Today, 12:30 PM"),
        WaterIntakeEntry(amount: "16 oz", timestamp: "Today, 3:45 PM"),
        WaterIntakeEntry(amount: "8 oz", timestamp: "Today, 10:00 AM"),
        WaterIntakeEntry(amount: "12 oz", timestamp: "Today, 12:30 PM"),
        WaterIntakeEntry(amount: "16 oz", timestamp: "Today, 3:45 PM")
    ]
    var body: some View {
        ZStack {
            List {
                Section(header: Text("Hydration Cards")
                    .font(.title).fontWeight(.bold).foregroundStyle(Color.primary).backgroundStyle(Color(uiColor: .systemBackground)).textCase(.none)) {
                    HStack {
                        VStack {
                            HydrationCardView(cardType: .hydrationTarget, amount: "2000")
                            HydrationCardView(cardType: .curretHydration, amount: "2000")
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
                .background(Color(uiColor: .systemBackground))
                
                Section(header: Text("Today's Water Log").font(.title).fontWeight(.bold).foregroundStyle(Color.primary).textCase(.none)) {
                    ForEach(waterIntakeEntries, id: \.self) { entry in
                        WaterIntakeRow(amount: entry.amount, timestamp: entry.timestamp)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                    }
                }
            }
            .background(Color(uiColor: .systemBackground))
            
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        isShowingAddView = true
                    } label: {
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
        }
    }
}

#Preview {
    HomeView()
}
