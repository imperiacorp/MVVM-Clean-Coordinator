//
//  FirstTabDetailsViewModel.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 13.02.2024.
//

import Foundation
import Combine

class FirstTabDetailsViewModel: BaseViewModel<FirstTabDetailsViewTransition> {
    
    let back: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    override init() {
        super.init()
        
        self.bind()
    }
    
    private func bind() {
        self.back
            .sink(receiveValue: { [weak self] in
                guard let self else { return }
                transitionSubject.send(.back)
            })
            .store(in: &cancellables)
    }
}

