//
//  AnalyticsViewModel.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//


import Combine
import SwiftUI


struct DailyActivity: Identifiable {
    let id = UUID()
    let day: String
    let calories: Int
}


struct CategoryProgress: Identifiable {
    let id = UUID()
    let category: String
    let percentage: Double
    let icon: String
}


final class AnalyticsViewModel: ObservableObject {
    @Published var selectedPeriod: String = "Неделя"
    let periods = ["Неделя", "Месяц", "Год"]
    
    @Published var dailyActivities: [DailyActivity] = [
        DailyActivity(day: "Пн", calories: 420),
        DailyActivity(day: "Вт", calories: 650),
        DailyActivity(day: "Ср", calories: 300),
        DailyActivity(day: "Чт", calories: 820),
        DailyActivity(day: "Пт", calories: 510),
        DailyActivity(day: "Сб", calories: 950),
        DailyActivity(day: "Вс", calories: 400)
    ]
    
    @Published var categoryProgress: [CategoryProgress] = [
        CategoryProgress(category: "Силовые", percentage: 0.45, icon: "figure.cross.training"),
        CategoryProgress(category: "Кардио", percentage: 0.30, icon: "figure.run"),
        CategoryProgress(category: "Растяжка / HIIT", percentage: 0.25, icon: "figure.flexibility")
    ]
    
    var totalCalories: Int {
        dailyActivities.reduce(0) { $0 + $1.calories }
    }
    
    var averageCalories: Int {
        dailyActivities.isEmpty ? 0 : totalCalories / dailyActivities.count
    }
}

