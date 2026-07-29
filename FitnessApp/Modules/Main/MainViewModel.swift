//
//  MainViewModel.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import Combine
import SwiftUI

final class MainViewModel: ObservableObject {
    @Published var userName: String = "Алексей"
    @Published var weeklyProgress: Double = 0.7
    @Published var completedWorkouts: Int = 12
    @Published var activeCalories: Int = 1420
    
  
    @Published var showLogoutAlert: Bool = false
    
    private unowned let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
  
    func confirmLogout() {
        showLogoutAlert = true
    }
    

    func logout() {
        coordinator.showAuth()
    }
}
