//
//  Untitled.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI


struct SportsTextFieldStyle: ViewModifier {
    let icon: String
    
    func body(content: Content) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(SportsTheme.accent)
                .frame(width: 24)
            
            content
                .foregroundColor(.white)
        }
        .padding()
        .background(SportsTheme.cardBackground)
        .cornerRadius(14)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.white.opacity(0.05), lineWidth: 1)
        )
    }
}


extension View {
    func sportsInputStyle(icon: String) -> some View {
        self.modifier(SportsTextFieldStyle(icon: icon))
    }
}
