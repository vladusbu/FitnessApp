//
//  Coordinator.swift
//  FitnessApp
//
//  Created by Vlad on 28.07.2026.
//



import SwiftUI



protocol Coordinator: ObservableObject {
    var path: NavigationPath { get set }
}


