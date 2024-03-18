//
//  ViewModel.swift
//  MVVM.Demo.SwiftUI
//
//  Created by Jason Lew-Rapai on 11/15/21.
//

import Foundation
import Combine

typealias ViewModelDefinition = (ObservableObject & Identifiable & Hashable)

protocol AppTransition {}

protocol ViewModel: ViewModelDefinition {}

extension ViewModel {
  static func ==(lhs: Self, rhs: Self) -> Bool {
    lhs === rhs
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.id)
  }
}

class BaseViewModel<T: AppTransition>: ViewModel {
    
    var cancellables = Set<AnyCancellable>()
    
    private(set) lazy var transitionPublisher = transitionSubject.eraseToAnyPublisher()
    var transitionSubject = PassthroughSubject<T, Never>()
}
