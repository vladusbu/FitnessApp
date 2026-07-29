//
//  AuthService.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import Foundation

protocol AuthServiceProtocol {
    func login(email: String, password: String) async throws -> User
}
