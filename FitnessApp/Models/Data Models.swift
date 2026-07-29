//
//  Data Models.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    let name: String
}

enum AuthError: LocalizedError {
    case invalidCredentials
    case emptyFields
    case networkError
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Неверный логин или пароль"
        case .emptyFields:
            return "Заполните все поля"
        case .networkError:
            return "Ошибка сети. Попробуйте позже"
        }
    }
}

