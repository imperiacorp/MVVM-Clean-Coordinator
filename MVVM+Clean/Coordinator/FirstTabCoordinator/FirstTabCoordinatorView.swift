//
//  FirstTabCoordinatorView.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import SwiftUI

struct FirstTabCoordinatorView: View {
    
    @State var coordinator: FirstTabCoordinator
        
    var body: some View {
        ObjectNavigationStack(path: self.coordinator.path) {
            FirstTabRootView(viewModel: coordinator.firstTabViewModel)
                .navigationDestination(for: FirstTabDetailsViewModel.self) { viewModel in
                    FirstTabDetailsView(viewModel: viewModel)
                }.navigationBarTitleDisplayMode(.inline)
        }
    }
}
