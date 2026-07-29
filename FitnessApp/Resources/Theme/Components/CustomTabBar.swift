//
//  CustomTabBar.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        selectedTab = tab
                    }
                } label: {
                    VStack(spacing: 6) {
                        Image(systemName: tab.rawValue)
                            .font(.system(size: 20, weight: .bold))
                            .scaleEffect(selectedTab == tab ? 1.15 : 1.0)
                        
                        Text(tab.title)
                            .font(.system(size: 10, weight: .semibold))
                    }
                    .foregroundColor(selectedTab == tab ? SportsTheme.accent : SportsTheme.textSecondary)
                    .frame(maxWidth: .infinity)
                }
                
                Spacer()
            }
        }
        .frame(height: 64)
        .background(
            SportsTheme.cardBackground
                .opacity(0.9)
                .background(.ultraThinMaterial)
        )
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.white.opacity(0.08), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.4), radius: 15, x: 0, y: 10)
        .padding(.horizontal, 16)
    }
}


#Preview {
    CustomTabBar(selectedTab: .constant(.home))
}
