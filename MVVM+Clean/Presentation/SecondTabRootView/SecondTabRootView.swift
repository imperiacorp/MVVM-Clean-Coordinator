//
//  SecondTabRootView.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import SwiftUI

struct SecondTabRootView: View {
    
    @ScaledMetric private var buttonPadding: CGFloat = 8.0
    @ScaledMetric private var inverseHorizontalPadding: CGFloat = 8.0
    
    @ObservedObject var viewModel: SecondTabRootViewModel
    
    var body: some View {
        List(viewModel.users) { user in
            UserView(user: user)
                .onTapGesture {
                    viewModel.showUserDetails.send(user.userId)
                }
                .navigationTitle("Users")
        }
    }
}
