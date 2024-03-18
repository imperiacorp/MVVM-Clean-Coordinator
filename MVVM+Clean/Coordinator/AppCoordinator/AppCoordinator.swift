//
//  AppCoordinator.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import Combine
import SwiftUI

class AppRootCoordinator: ObservableObject {
    
    @Published var isAuthPresented = false
    
    var cancellables = Set<AnyCancellable>()

    let cancelSignIn: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    var firstTabCoordinator = FirstTabCoordinator()
    var secondTabCoordinator = SecondTabCoordinator()
        
    init() {
        setupBindings()
    }
    
    func showSignIn() -> SignInViewModel {
        let signInViewModel = SignInViewModel()
        signInViewModel.transitionPublisher.sink { [unowned self] transition in
            switch transition {
            case .cancel:
                self.isAuthPresented = false
            case .signIn:
                debugPrint("signed in")
            }
        }.store(in: &cancellables)
        
        return signInViewModel
    }
    
    func setupBindings() {
        firstTabCoordinator.$isAuthPresented.sink { [weak self] presented in
            self?.isAuthPresented = presented
        }.store(in: &cancellables)
    }
}
