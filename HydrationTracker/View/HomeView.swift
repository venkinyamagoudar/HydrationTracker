//
//  HomeView.swift
//  HydrationTracker
//
//  Created by Venkatesh Nyamagoudar on 3/17/24.
//

import SwiftUI

struct HomeView: View {
    @State var isShowingAddView: Bool = false
    @State var currentHydration: Int = 0
    @State var targetHydration: Int = 0
    
    @State var waterIntakeEntries: [WaterIntakeEntry] = []
    var body: some View {
        ZStack {
            List {
                Section(header: Text("Hydration Cards")
                    .font(.title).fontWeight(.bold).foregroundStyle(Color.primary).backgroundStyle(Color(uiColor: .systemBackground)).textCase(.none)) {
                    HStack {
                        VStack {
                            HydrationCardView(cardType: .hydrationTarget, amount: targetHydration)
                            HydrationCardView(cardType: .curretHydration, amount: currentHydration)
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
                .background(Color(uiColor: .systemBackground))
                
                Section(header: Text("Today's Water Log").font(.title).fontWeight(.bold).foregroundStyle(Color.primary).textCase(.none)) {
                    ForEach(waterIntakeEntries ?? [], id: \.self) { entry in
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
                        isShowingAddView.toggle()
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
        .sheet(isPresented: $isShowingAddView) {
            AddWaterIntakeView(isPresented: $isShowingAddView, numberOfGlasses: $currentHydration, waterIntakeEntries: $waterIntakeEntries){
                currentHydration += $0
            }
                .presentationDetents([.medium])
                .presentationBackgroundInteraction(.disabled)
        }
    }
}

#Preview {
    HomeView()
}
