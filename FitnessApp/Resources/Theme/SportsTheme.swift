//
//  SportsTheme.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI

enum SportsTheme {
    static let background = Color(white: 0.08)
    static let cardBackground = Color(white: 0.14)
    static let accent = Color(red: 0.22, green: 0.95, blue: 0.45)
    static let accentGradient = LinearGradient(
        colors: [Color(red: 0.22, green: 0.95, blue: 0.45), Color(red: 0.10, green: 0.80, blue: 0.35)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let textSecondary = Color.gray
}
