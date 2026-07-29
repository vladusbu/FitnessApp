//
//  SignUpView.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI


struct SignUpView: View {

    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            SportsTheme.background.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28) {
                    
       
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Создать аккаунт")
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text("Начните свой путь к цели")
                            .font(.subheadline)
                            .foregroundColor(SportsTheme.textSecondary)
                    }
                    .padding(.top, 20)
                    
              
                    VStack(spacing: 16) {
                        TextField("Имя", text: $viewModel.name)
                            .sportsInputStyle(icon: "person.fill")
                        
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .sportsInputStyle(icon: "envelope.fill")
                        
                        SecureField("Пароль", text: $viewModel.password)
                            .sportsInputStyle(icon: "lock.fill")
                        
                        SecureField("Подтверждение пароля", text: $viewModel.confirmPassword)
                            .sportsInputStyle(icon: "lock.shield.fill")
                    }
                    
              
                    Toggle(isOn: $viewModel.isTermsAccepted) {
                        Text("Я согласен с условиями использования")
                            .font(.footnote)
                            .foregroundColor(SportsTheme.textSecondary)
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    
      
                    Button(action: {
                        viewModel.signUp()
                    }) {
                        Text("Зарегистрироваться")
                            .font(.headline.weight(.bold))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(viewModel.isTermsAccepted ? SportsTheme.accentGradient : LinearGradient(colors: [Color.gray.opacity(0.3)], startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(16)
                            .shadow(color: viewModel.isTermsAccepted ? SportsTheme.accent.opacity(0.3) : Color.clear, radius: 10, x: 0, y: 5)
                    }
                    .disabled(!viewModel.isTermsAccepted)
                    
                    Spacer()
                    
        
                    HStack {
                        Spacer()
                        Text("Уже есть аккаунт?")
                            .foregroundColor(SportsTheme.textSecondary)
                        
                        Button("Войти") {
                            viewModel.backToLogin()
                        }
                        .foregroundColor(SportsTheme.accent)
                        .bold()
                        Spacer()
                    }
                    .font(.subheadline)
                    .padding(.bottom, 16)
                }
                .padding(.horizontal, 24)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { viewModel.backToLogin() }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                }
            }
        }
    }
}


