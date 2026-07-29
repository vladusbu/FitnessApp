//
//  AuthCoordinatorView.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI

struct AuthCoordinatorView: View {
    @StateObject private var coordinator: AuthCoordinator
    
    init(appCoordinator: AppCoordinator) {
        _coordinator = StateObject(wrappedValue: AuthCoordinator(appCoordinator: appCoordinator))
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(route: .login)
                .navigationDestination(for: AuthRoute.self) { route in
                    coordinator.build(route: route)
                }
        }
    }
}

