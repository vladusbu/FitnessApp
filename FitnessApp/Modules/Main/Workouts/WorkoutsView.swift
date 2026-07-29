//
//  WorkoutsView.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI

struct WorkoutsView: View {
    @StateObject private var viewModel = WorkoutsViewModel()
    
    var body: some View {
        ZStack {
            SportsTheme.background.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
          
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Каталог")
                            .font(.subheadline)
                            .foregroundColor(SportsTheme.textSecondary)
                        
                        Text("Тренировки")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 16)
                    
                
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(SportsTheme.textSecondary)
                        
                        TextField("Поиск тренировки...", text: $viewModel.searchText)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(SportsTheme.cardBackground)
                    .cornerRadius(14)
                    
 
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(WorkoutCategory.allCases) { category in
                                CategoryChip(
                                    title: category.rawValue,
                                    isSelected: viewModel.selectedCategory == category
                                ) {
                                    withAnimation(.spring(response: 0.2)) {
                                        viewModel.selectedCategory = category
                                    }
                                }
                            }
                        }
                    }
                    
  
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("ТРЕНИРОВКА ДНЯ")
                                    .font(.caption.bold())
                                    .foregroundColor(SportsTheme.accent)
                                
                                Text("Full Body Blast")
                                    .font(.title2.bold())
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Image(systemName: "flame.fill")
                                .font(.system(size: 32))
                                .foregroundColor(.orange)
                        }
                        
                        Text("Комплекс на все группы мышц без дополнительного оборудования.")
                            .font(.footnote)
                            .foregroundColor(SportsTheme.textSecondary)
                        
                        Button(action: {
        
                        }) {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Начать (35 мин)")
                            }
                            .font(.subheadline.bold())
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(SportsTheme.accentGradient)
                            .cornerRadius(12)
                        }
                        .padding(.top, 4)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(SportsTheme.cardBackground)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(SportsTheme.accent.opacity(0.2), lineWidth: 1)
                            )
                    )
                    
     
                    Text("Все программы (\(viewModel.filteredWorkouts.count))")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .padding(.top, 8)
                    
                    LazyVStack(spacing: 14) {
                        ForEach(viewModel.filteredWorkouts) { workout in
                            WorkoutRowCard(workout: workout)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 100)
            }
        }
    }
}


struct CategoryChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline.weight(isSelected ? .bold : .medium))
                .foregroundColor(isSelected ? .black : .white)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(isSelected ? SportsTheme.accent : SportsTheme.cardBackground)
                .cornerRadius(20)
        }
    }
}


struct WorkoutRowCard: View {
    let workout: Workout
    
    var body: some View {
        HStack(spacing: 16) {

            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.05))
                    .frame(width: 56, height: 56)
                
                Image(systemName: workout.imageName)
                    .font(.title2)
                    .foregroundColor(SportsTheme.accent)
            }
            
          
            VStack(alignment: .leading, spacing: 6) {
                Text(workout.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                HStack(spacing: 12) {
                    Label("\(workout.durationMinutes) мин", systemImage: "clock")
                    Label("\(workout.caloriesBurned) ккал", systemImage: "flame")
                }
                .font(.caption)
                .foregroundColor(SportsTheme.textSecondary)
            }
            
            Spacer()
            
       
            Image(systemName: "chevron.right")
                .font(.footnote.weight(.bold))
                .foregroundColor(SportsTheme.textSecondary)
        }
        .padding()
        .background(SportsTheme.cardBackground)
        .cornerRadius(16)
    }
}


#Preview {
    WorkoutsView()
        .preferredColorScheme(.dark)
}

