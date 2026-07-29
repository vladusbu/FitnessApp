//
//  ToggleStyles.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI


struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 12) {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? SportsTheme.accent : SportsTheme.textSecondary)
                .font(.title3)
                .onTapGesture {
                    withAnimation(.spring(response: 0.2)) {
                        configuration.isOn.toggle()
                    }
                }
            
            configuration.label
        }
    }
}
