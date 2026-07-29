//
//  MainView.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            SportsTheme.background.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("С возвращением,")
                                .font(.subheadline)
                                .foregroundColor(SportsTheme.textSecondary)
                            
                            Text(viewModel.userName)
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.confirmLogout()
                        }) {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .font(.title3)
                                .foregroundColor(.red.opacity(0.8))
                                .padding(12)
                                .background(SportsTheme.cardBackground)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.top, 16)
                    
                 
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Прогресс за неделю")
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                            Text("\(Int(viewModel.weeklyProgress * 100))%")
                                .font(.subheadline.bold())
                                .foregroundColor(SportsTheme.accent)
                        }
                        
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(Color.white.opacity(0.1))
                                    .frame(height: 8)
                                
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(SportsTheme.accentGradient)
                                    .frame(width: geometry.size.width * CGFloat(viewModel.weeklyProgress), height: 8)
                            }
                        }
                        .frame(height: 8)
                        
                        Text("Осталось 2 тренировки до выполнения цели!")
                            .font(.caption)
                            .foregroundColor(SportsTheme.textSecondary)
                    }
                    .padding()
                    .background(SportsTheme.cardBackground)
                    .cornerRadius(20)
                    

                    Text("Активность")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        MetricCard(
                            title: "Тренировок",
                            value: "\(viewModel.completedWorkouts)",
                            unit: "за месяц",
                            icon: "figure.cross.training",
                            iconColor: SportsTheme.accent
                        )
                        
                        MetricCard(
                            title: "Активные ккал",
                            value: "\(viewModel.activeCalories)",
                            unit: "ккал",
                            icon: "flame.fill",
                            iconColor: Color.orange
                        )
                    }
                    
            
                    VStack(spacing: 16) {
                        Text("Готовы к новой сессии?")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Button(action: {
   
                        }) {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Начать тренировку")
                            }
                            .font(.headline.weight(.bold))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(SportsTheme.accentGradient)
                            .cornerRadius(16)
                            .shadow(color: SportsTheme.accent.opacity(0.3), radius: 10, x: 0, y: 5)
                        }
                    }
                    .padding()
                    .background(SportsTheme.cardBackground)
                    .cornerRadius(20)
                    .padding(.top, 8)
                }
                .padding(.horizontal, 24)
            }
        }.alert("Выход из аккаунта", isPresented: $viewModel.showLogoutAlert) {
            Button("Выйти", role: .destructive) {
                viewModel.logout()
            }
            Button("Отмена", role: .cancel) { }
        } message: {
            Text("Вы уверены, что хотите выйти из приложения?")
        }
        
    }
}


struct MetricCard: View {
    let title: String
    let value: String
    let unit: String
    let icon: String
    let iconColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(iconColor)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(value)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(SportsTheme.textSecondary)
            }
        }
        .padding()
        .background(SportsTheme.cardBackground)
        .cornerRadius(16)
    }
}



#Preview {
    let appCoordinator = AppCoordinator()
    let viewModel = MainViewModel(coordinator: appCoordinator)
    
    MainTabView(viewModel: viewModel)
        .preferredColorScheme(.dark)
}

