//
//  SecondTabCoordinatorView.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import SwiftUI

struct SecondTabCoordinatorView: View {
    @State var coordinator: SecondTabCoordinator
    
    var body: some View {
        ObjectNavigationStack(path: self.coordinator.path) {
            SecondTabRootView(viewModel: coordinator.secondTabViewModel)
                .navigationDestination(for: SecondTabDetailsViewModel.self) { viewModel in
                    SecondTabDetailsView(viewModel: viewModel)
                }
        }
    }
}
