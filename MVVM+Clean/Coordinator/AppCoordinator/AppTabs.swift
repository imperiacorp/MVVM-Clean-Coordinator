//
//  AppTabs.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import SwiftUI

enum AppTabs: Hashable, Identifiable, CaseIterable {
    
    case first
    case second
    
    var id: AppTabs { self }
}

extension AppTabs {
    
    @ViewBuilder
    var label: some View {
        switch self {
            case .first:
                Label("First", systemImage: "1.circle")
            case .second:
                Label("Second", systemImage: "2.circle")
        }
    }
}
