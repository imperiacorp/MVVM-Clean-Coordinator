//
//  AppCoordinatorView.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import SwiftUI

struct AppCoordinatorView: View {
    @State var selection: AppTabs?
    
    @StateObject var coordinator: AppRootCoordinator
    
    var body: some View {
        TabView(selection: $selection) {
            FirstTabCoordinatorView(coordinator: coordinator.firstTabCoordinator)
                .tabItem { AppTabs.first.label }
                .tag(AppTabs.first)
            
            SecondTabCoordinatorView(coordinator: coordinator.secondTabCoordinator)
                .tabItem { AppTabs.second.label }
                .tag(AppTabs.second)
        }.fullScreenCover(isPresented: $coordinator.isAuthPresented) {
            SignInView(viewModel: coordinator.showSignIn())
        }
    }
}
