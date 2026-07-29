//
//  ProfileView.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI



struct ProfileView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            List {

                Section {
                    HStack(spacing: 16) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.accentColor)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.userName)
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            Text(viewModel.userEmail)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }
                
              
                Section(header: Text("Физические параметры")) {
                    HStack {
                        Label("Вес", systemImage: "scalemass.fill")
                            .foregroundColor(.blue)
                        Spacer()
                        Text("\(viewModel.weightKg, specifier: "%.1f") кг")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Label("Рост", systemImage: "ruler.fill")
                            .foregroundColor(.green)
                        Spacer()
                        Text("\(viewModel.heightCm) см")
                            .foregroundColor(.secondary)
                    }
                }
                
         
                Section(header: Text("Текущая цель")) {
                    Picker("Цель", selection: $viewModel.selectedGoal) {
                        ForEach(SportsGoal.allCases, id: \.self) { goal in
                            Text(goal.rawValue).tag(goal)
                        }
                    }
                    .pickerStyle(.menu)
                }
                

                Section(header: Text("Настройки")) {
                    Toggle(isOn: $viewModel.isWorkoutRemindersEnabled) {
                        Label("Напоминания о тренировках", systemImage: "bell.badge.fill")
                            .foregroundColor(.orange)
                    }
                    
                    Toggle(isOn: $viewModel.isAppleHealthSynced) {
                        Label("Синхронизация с Apple Health", systemImage: "heart.text.square.fill")
                            .foregroundColor(.red)
                    }
                }
                

                Section {
                    Button(role: .destructive) {
                        viewModel.confirmLogout()
                    } label: {
                        HStack {
                            Spacer()
                            Label("Выйти из аккаунта", systemImage: "rectangle.portrait.and.arrow.right")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Профиль")
            .navigationBarTitleDisplayMode(.large)
    
            .alert("Выход из аккаунта", isPresented: $viewModel.showLogoutAlert) {
                Button("Отмена", role: .cancel) { }
                Button("Выйти", role: .destructive) {
                    appCoordinator.showAuth()
                }
            } message: {
                Text("Вы уверены, что хотите выйти? Вам придется заново ввести логин и пароль.")
            }
        }
    }
}


#Preview {
    ProfileView()
        .environmentObject(AppCoordinator())
        .preferredColorScheme(.dark)
}








