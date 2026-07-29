//
//  WorkoutsViewModel.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//


import Combine
import SwiftUI

struct Workout: Identifiable {
    let id = UUID()
    let title: String
    let category: WorkoutCategory
    let durationMinutes: Int
    let caloriesBurned: Int
    let level: String
    let imageName: String
}

enum WorkoutCategory: String, CaseIterable, Identifiable {
    case all = "Все"
    case cardio = "Кардио"
    case strength = "Силовые"
    case hiit = "HIIT"
    case yoga = "Растяжка"
    
    var id: String { self.rawValue }
}


final class WorkoutsViewModel: ObservableObject {
    @Published var selectedCategory: WorkoutCategory = .all
    @Published var searchText: String = ""
    
    @Published var workouts: [Workout] = [
        Workout(title: "Силовой интенсив", category: .strength, durationMinutes: 45, caloriesBurned: 420, level: "Продвинутый", imageName: "figure.cross.training"),
        Workout(title: "Утренний HIIT", category: .hiit, durationMinutes: 25, caloriesBurned: 310, level: "Средний", imageName: "figure.highintensity.intervaltraining"),
        Workout(title: "Жиросжигающий бег", category: .cardio, durationMinutes: 30, caloriesBurned: 350, level: "Начинающий", imageName: "figure.run"),
        Workout(title: "Глубокая растяжка", category: .yoga, durationMinutes: 20, caloriesBurned: 120, level: "Все уровни", imageName: "figure.flexibility"),
        Workout(title: "Пресс и Кор", category: .strength, durationMinutes: 30, caloriesBurned: 260, level: "Средний", imageName: "figure.core.training")
    ]
    
    var filteredWorkouts: [Workout] {
        workouts.filter { workout in
            let matchesCategory = (selectedCategory == .all || workout.category == selectedCategory)
            let matchesSearch = searchText.isEmpty || workout.title.localizedCaseInsensitiveContains(searchText)
            return matchesCategory && matchesSearch
        }
    }
}
