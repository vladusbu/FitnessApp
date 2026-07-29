//
//  AuthService.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import Foundation


final class AuthService: AuthServiceProtocol {
    
    func login(email: String, password: String) async throws -> User {
       
        try await Task.sleep(nanoseconds: 1_500_000_000)
        
        if email.lowercased() == "test@test.com" && password == "123456" {
           
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            
            return User(id: UUID().uuidString, email: email, name: "Алексей")
        } else {
            throw AuthError.invalidCredentials
        }
    }
}
