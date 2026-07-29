//
//  Tab.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI

enum Tab: String, CaseIterable {
    case home = "house.fill"
    case workouts = "figure.cross.training"
    case analytics = "chart.bar.fill"
    case profile = "person.fill"
    
    var title: String {
        switch self {
        case .home: return "Главная"
        case .workouts: return "Тренировки"
        case .analytics: return "Аналитика"
        case .profile: return "Профиль"
        }
    }
}
