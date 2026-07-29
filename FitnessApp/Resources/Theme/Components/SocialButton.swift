//
//  SocialButton.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI


struct SocialButton: View {
    let iconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
                .font(.title2)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(SportsTheme.cardBackground)
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.05), lineWidth: 1)
                )
        }
    }
}
