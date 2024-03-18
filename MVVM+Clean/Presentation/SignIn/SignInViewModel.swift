//
//  SignInViewModel.swift
//  MVVM.Demo.SwiftUI
//
//  Created by Jason Lew-Rapai on 11/15/21.
//

import Foundation
import Combine
import SwiftUI

class SignInViewModel: BaseViewModel<SignInTransition> {
    var thing: String = ""
    
    var username: String = "" {
        didSet { self.username$.send(self.username) }
    }
    private let username$: CurrentValueSubject<String, Never> = CurrentValueSubject("")
    
    var password: String = "" {
        didSet { self.password$.send(self.password) }
    }
    private let password$: CurrentValueSubject<String, Never> = CurrentValueSubject("")
    
    let cancel: PassthroughSubject<Void, Never> = PassthroughSubject()
    let signIn: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    private(set) var canSignIn: AnyPublisher<Bool, Never>!
        
    override init() {
        super.init()
        
        bind()
        
        canSignIn = username$.combineLatest(password$)
            .map {
                !$0.0.isEmpty && !$0.1.isEmpty && $0.0 == $0.1
            }
            .eraseToAnyPublisher()
    }
    
    private func bind() {
        
        self.cancel
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.transitionSubject.send(.cancel)
            })
            .store(in: &cancellables)
        
        self.signIn
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.transitionSubject.send(.signIn)
            })
            .store(in: &cancellables)
    }
}
