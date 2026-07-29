//
//  LoginViewModel.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//


import Combine
import SwiftUI

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private unowned let coordinator: AuthCoordinator
    private let authService: AuthServiceProtocol
    
    init(coordinator: AuthCoordinator, authService: AuthServiceProtocol = AuthService()) {
        self.coordinator = coordinator
        self.authService = authService
    }
    
    func login() {
     
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.isEmpty else {
            errorMessage = AuthError.emptyFields.localizedDescription
            return
        }
        
        errorMessage = nil
        isLoading = true
     
        Task {
            do {
                let _ = try await authService.login(email: email, password: password)
                
                isLoading = false
                
                coordinator.finishAuth()
            } catch {
                isLoading = false
            
                if let authError = error as? AuthError {
                    errorMessage = authError.localizedDescription
                } else {
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func goToSignUp() {
        coordinator.showSignUp()
    }
}


