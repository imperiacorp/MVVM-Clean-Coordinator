//
//  Button+Extensions.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 20.02.2024.
//

import SwiftUI
import Combine

extension Button {
  init(action: PassthroughSubject<Void, Never>, @ViewBuilder label: () -> Label) {
    self.init(action: { action.send() }, label: label)
  }
}
