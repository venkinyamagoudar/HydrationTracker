//
//  HydrationTabView.swift
//  HydrationTracker
//
//  Created by Venkatesh Nyamagoudar on 3/17/24.
//

import SwiftUI

struct HydrationTabView: View {
    @State private var selectedTab: TabImages = .house
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Image(systemName: TabImages.house.rawValue)
                Text("Home")
            }
            .tag(TabImages.house)
            
            NavigationView {
                StatisticsView(viewModel: StatisticsViewModel())
            }
            .tabItem {
                Image(systemName: TabImages.statistics.rawValue)
                Text("Activity")
            }
            .tag(TabImages.statistics)
        }
        .background(Color(uiColor: .secondarySystemBackground))
        .onAppear{
            NotificationManager.shared.requestAuthorization()
            NotificationManager.shared.scheduleDailyNotification()
        }
    }
}

#Preview {
    HydrationTabView()
}


enum TabImages: String, CaseIterable {
    case house = "house"
    case statistics = "chart.bar.xaxis"
}
