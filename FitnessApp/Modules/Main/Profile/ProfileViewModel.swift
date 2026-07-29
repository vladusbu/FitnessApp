//
//  ProfileViewModel.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
    @Published var userName: String = "Александр Смирнов"
    @Published var userEmail: String = "alex.smirnov@example.com"
    @Published var weightKg: Double = 78.5
    @Published var heightCm: Int = 182
    
    @Published var isWorkoutRemindersEnabled: Bool = true
    @Published var isAppleHealthSynced: Bool = true
    @Published var selectedGoal: SportsGoal = .buildMuscle
    
    @Published var showLogoutAlert: Bool = false
    
    func confirmLogout() {
        showLogoutAlert = true
    }
}




enum SportsGoal: String, CaseIterable, Identifiable {
    case loseWeight = "Снижение веса"
    case buildMuscle = "Набор мышечной массы"
    case keepFit = "Поддержание формы"
    case endurance = "Развитие выносливости"
    
    var id: String { self.rawValue }
}

