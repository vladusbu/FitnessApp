//
//  MainTabView.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI

struct MainTabView: View {
    @ObservedObject var viewModel: MainViewModel
    @State private var selectedTab: Tab = .home
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                MainView(viewModel: viewModel)
                    .tag(Tab.home)
                
                WorkoutsView()
                    .tag(Tab.workouts)
                
                AnalyticsView()
                    .tag(Tab.analytics)
                
             
                ProfileView()
                    .tag(Tab.profile)
            }
            .ignoresSafeArea(edges: .bottom)
            
            CustomTabBar(selectedTab: $selectedTab)
                .padding(.bottom, 8)
        }
    }
}

