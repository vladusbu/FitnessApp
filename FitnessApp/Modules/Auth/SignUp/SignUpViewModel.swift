//
//  SignUpViewModel.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import Combine
import SwiftUI

final class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isTermsAccepted = false
    
    private unowned let coordinator: AuthCoordinator
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
    }
    
    func signUp() {

        coordinator.finishAuth()
    }

    
    func backToLogin() {
        coordinator.pop()
    }
}
