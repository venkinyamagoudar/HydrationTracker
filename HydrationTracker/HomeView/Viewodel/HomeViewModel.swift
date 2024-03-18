//
//  HomeViewModel.swift
//  HydrationTracker
//
//  Created by Venkatesh Nyamagoudar on 3/18/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var isShowingAddView: Bool = false
    @Published var dailyHydration: DailyHydration?
    @Published var isNotificationSettingsPresented = false
    
    let coreDataManager = CoreDataManager.shared
    
    func fetchDailyHydration(for date: Date) {
        dailyHydration = coreDataManager.fetchDailyHydration(for: date)
        checkTargetAchievement()
    }
    
    func createDailyHydrationIfNeeded(for date: Date) {
        guard let newDailyHydration = coreDataManager.createDailyHydrationIfNeeded(for: date) else {
            return
        }
        dailyHydration = newDailyHydration
    }
    
    func updateHydrationTarget(target: Int) {
        guard let dailyHydration = dailyHydration,
              let dailyHydrationID = dailyHydration.id else { return }
        
        guard let updatedDailyHydration = coreDataManager.updateHydrationTarget(for: dailyHydrationID, target: target) else { return }
        
        self.dailyHydration = updatedDailyHydration
    }
    
    func updateCurrentHydration(amount: Int16) {
        guard let dailyHydration = dailyHydration,
              let dailyHydrationID = dailyHydration.id else { return }
        
        guard let updatedDailyHydration = coreDataManager.updateCurrentHydration(for: dailyHydrationID, amount: amount) else { return }
        
        self.dailyHydration = updatedDailyHydration
    }
    
    func addWaterIntakeEntry(numberOfGlasses: Int) {
        guard let dailyHydration = dailyHydration,
              let dailyHydrationID = dailyHydration.id,
              let updatedDailyHydration = coreDataManager.addWaterIntakeEntry(in: dailyHydrationID, using: numberOfGlasses, timestamp: Date.now) else { return }
        self.dailyHydration = updatedDailyHydration
        checkTargetAchievement()
    }
    
    func deleteWaterIntakeEntry(item : WaterIntakeEntry) {
        guard let dailyHydration = dailyHydration,
              let dailyHydrationID = dailyHydration.id,
              let updatedDailyHydration = coreDataManager.deleteWaterIntakeEntry(in: dailyHydrationID, item: item) else { return }
        self.dailyHydration = updatedDailyHydration
    }
    
    func checkTargetAchievement() {
        guard let dailyHydration = dailyHydration else {
            return
        }
        let target = dailyHydration.targetHydration
        let current = dailyHydration.currentHydration
        let today = Date()
        let userDefaults = UserDefaults.standard
        if let lastNotificationDate = userDefaults.object(forKey: "lastAchievementNotificationDate") as? Date,
           Calendar.current.isDate(lastNotificationDate, inSameDayAs: today) {
            return
        }
        if current >= target {
            NotificationManager.shared.sendAchievementNotification()
            userDefaults.set(today, forKey: "lastAchievementNotificationDate")
        }
    }
    
}
