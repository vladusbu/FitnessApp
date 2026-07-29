//
//  AnalitycsView.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI
import Charts 

struct AnalyticsView: View {
    @StateObject private var viewModel = AnalyticsViewModel()
    
    var body: some View {
        ZStack {
            SportsTheme.background.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                   
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Прогресс")
                                .font(.subheadline)
                                .foregroundColor(SportsTheme.textSecondary)
                            
                            Text("Аналитика")
                                .font(.system(size: 32, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                     
                        Picker("Период", selection: $viewModel.selectedPeriod) {
                            ForEach(viewModel.periods, id: \.self) { period in
                                Text(period)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(SportsTheme.accent)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(SportsTheme.cardBackground)
                        .cornerRadius(12)
                    }
                    .padding(.top, 16)
               
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(alignment: .bottom) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Сожжено энергии")
                                    .font(.caption)
                                    .foregroundColor(SportsTheme.textSecondary)
                                
                                HStack(alignment: .firstTextBaseline, spacing: 4) {
                                    Text("\(viewModel.totalCalories)")
                                        .font(.system(size: 32, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                    
                                    Text("ккал")
                                        .font(.subheadline.bold())
                                        .foregroundColor(SportsTheme.accent)
                                }
                            }
                            
                            Spacer()
                            
                            Text("Среднее: \(viewModel.averageCalories) ккал/день")
                                .font(.caption)
                                .foregroundColor(SportsTheme.textSecondary)
                        }
                        
                  
                        Chart(viewModel.dailyActivities) { item in
                            BarMark(
                                x: .value("День", item.day),
                                y: .value("Калории", item.calories)
                            )
                            .foregroundStyle(
                                item.calories >= 800 ? SportsTheme.accentGradient : LinearGradient(colors: [Color.white.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                            )
                            .cornerRadius(6)
                        }
                        .frame(height: 180)
                        .chartYAxis(.hidden)
                        .chartXAxis {
                            AxisMarks(values: .automatic) { _ in
                                AxisValueLabel()
                                    .foregroundStyle(Color.gray)
                            }
                        }
                    }
                    .padding()
                    .background(SportsTheme.cardBackground)
                    .cornerRadius(20)
                   
                    Text("Распределение нагрузки")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    
                    VStack(spacing: 16) {
                        ForEach(viewModel.categoryProgress) { progress in
                            VStack(spacing: 8) {
                                HStack {
                                    Image(systemName: progress.icon)
                                        .foregroundColor(SportsTheme.accent)
                                        .frame(width: 24)
                                    
                                    Text(progress.category)
                                        .font(.subheadline.weight(.semibold))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    Text("\(Int(progress.percentage * 100))%")
                                        .font(.subheadline.bold())
                                        .foregroundColor(SportsTheme.textSecondary)
                                }
                                
                                GeometryReader { geometry in
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(Color.white.opacity(0.1))
                                            .frame(height: 6)
                                        
                                        RoundedRectangle(cornerRadius: 4)
                                            .fill(SportsTheme.accent)
                                            .frame(width: geometry.size.width * CGFloat(progress.percentage), height: 6)
                                    }
                                }
                                .frame(height: 6)
                            }
                        }
                    }
                    .padding()
                    .background(SportsTheme.cardBackground)
                    .cornerRadius(20)
                   
                    Text("Личные рекорды")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        AchievementCard(
                            title: "Макс. за день",
                            value: "950 ккал",
                            subtitle: "Суббота",
                            icon: "trophy.fill",
                            iconColor: .yellow
                        )
                        
                        AchievementCard(
                            title: "Серия тренировок",
                            value: "5 дней",
                            subtitle: "Текущий страйк",
                            icon: "flame.fill",
                            iconColor: .orange
                        )
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 100)
            }
        }
    }
}

struct AchievementCard: View {
    let title: String
    let value: String
    let subtitle: String
    let icon: String
    let iconColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(iconColor)
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(value)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(SportsTheme.textSecondary)
                
                Text(subtitle)
                    .font(.caption2)
                    .foregroundColor(SportsTheme.accent)
                    .padding(.top, 2)
            }
        }
        .padding()
        .background(SportsTheme.cardBackground)
        .cornerRadius(16)
    }
}

#Preview {
    AnalyticsView()
        .preferredColorScheme(.dark)
}

