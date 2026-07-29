//
//  AppCoordinator.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//


import Combine
import SwiftUI


enum AppState {
    case auth
    case main
}

final class AppCoordinator: ObservableObject {
    @Published var appState: AppState = .auth
    @Published var mainPath = NavigationPath()
    
  
    func showMain() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            appState = .main
        }
    }
    
    func showAuth() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            appState = .auth
        }
    }
}





struct RootCoordinatorView: View {
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some View {
        Group {
            switch appCoordinator.appState {
            case .auth:
                AuthCoordinatorView(appCoordinator: appCoordinator)
            case .main:
                NavigationStack(path: $appCoordinator.mainPath) {
                    MainTabView(viewModel: MainViewModel(coordinator: appCoordinator))
                }
            }
        }
        
        .environmentObject(appCoordinator)
        .preferredColorScheme(.dark)
    }
}




#Preview {
    RootCoordinatorView()
}

