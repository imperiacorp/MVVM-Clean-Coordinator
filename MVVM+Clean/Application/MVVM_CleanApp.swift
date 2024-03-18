//
//  MVVM_CleanApp.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import SwiftUI

@main
struct MVVM_CleanApp: App {
        
    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(coordinator: AppRootCoordinator())
        }
    }
}
