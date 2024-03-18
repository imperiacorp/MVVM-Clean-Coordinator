//
//  FirstTabRootViewModel.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import Foundation
import Combine

class FirstTabRootViewModel: BaseViewModel<FirstTabRootViewTransition> {
    
    let pulse: PassthroughSubject<Void, Never> = PassthroughSubject()
    let signInOrOut: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    override init() {
        super.init()
        
        self.bind()
    }
    
    private func bind() {
        self.pulse
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                transitionSubject.send(.pulse)
            })
            .store(in: &cancellables)
        
        self.signInOrOut
            .sink { [weak self] in
                guard let self else { return }
                transitionSubject.send(.signIn)
            }
            .store(in: &cancellables)
    }
}
