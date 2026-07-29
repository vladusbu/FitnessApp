//
//  LoginView.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        ZStack {
            SportsTheme.background.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Вход в аккаунт")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                
                SecureField("Пароль", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                
            
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                }
        
                Button(action: {
                    viewModel.login()
                }) {
                    HStack {
                        if viewModel.isLoading {
                            ProgressView()
                                .tint(.black)
                        } else {
                            Text("Войти")
                                .bold()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(SportsTheme.accent)
                    .foregroundColor(.black)
                    .cornerRadius(12)
                }
                .disabled(viewModel.isLoading)
                
                Button("Регистрация") {
                    viewModel.goToSignUp()
                }
                .foregroundColor(SportsTheme.accent)
            }
            .padding(24)
        }
    }
}


#Preview {

    AuthCoordinatorView(appCoordinator: AppCoordinator())
        .preferredColorScheme(.dark)
}



