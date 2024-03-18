//
//  FirstTabCoordinator.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import Combine
import SwiftUI

class FirstTabCoordinator {
    
    @Published var isAuthPresented = false
    
    var cancellables = Set<AnyCancellable>()
    
    let path = ObjectNavigationPath()
    
    private(set) var firstTabViewModel: FirstTabRootViewModel
    
    init() {
        firstTabViewModel = FirstTabRootViewModel()
        firstTabViewModel.transitionPublisher.sink { [unowned self] transition in
            switch transition {
            case .pulse:
                showDetails()
            case .signIn:
                self.isAuthPresented = true
            case .colorWizard:
                debugPrint("color")
            }
        }.store(in: &cancellables)
    }
    
    func showDetails() {
        let firstDetailsViewModel = FirstTabDetailsViewModel()
        firstDetailsViewModel.transitionPublisher.sink { [weak self] transition in
            switch transition {
            case .back:
                self?.path.removeLast()
            }
        }.store(in: &cancellables)
        path.append(firstDetailsViewModel)
    }
}
