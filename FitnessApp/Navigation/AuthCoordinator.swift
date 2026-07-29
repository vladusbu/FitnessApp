//
//  AuthCoordinator.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//

import Combine
import SwiftUI

final class AuthCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    private unowned let appCoordinator: AppCoordinator
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    func showSignUp() {
        path.append(AuthRoute.signUp)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func finishAuth() {
        appCoordinator.showMain()
    }
    
    @ViewBuilder
    func build(route: AuthRoute) -> some View {
        switch route {
        case .login:
            let viewModel = LoginViewModel(coordinator: self)
            LoginView(viewModel: viewModel)
        case .signUp:
            let viewModel = SignUpViewModel(coordinator: self)
            SignUpView(viewModel: viewModel)
        }
    }
}


