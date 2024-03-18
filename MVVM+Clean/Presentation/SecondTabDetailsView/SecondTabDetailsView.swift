//
//  SecondTabDetailsView.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 13.02.2024.
//

import SwiftUI

struct SecondTabDetailsView: View {
    
    @ScaledMetric private var buttonPadding: CGFloat = 8.0
    @ScaledMetric private var inverseHorizontalPadding: CGFloat = 8.0
    
    @ObservedObject var viewModel: SecondTabDetailsViewModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.user.avatarURL)) { image in
                image.resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            .padding()
            
            Text(viewModel.user.login).padding()
            
            Text(LocalizedStringKey(viewModel.user.htmlURL))
                .environment(\.openURL, OpenURLAction { url in
                    return .systemAction
                })
        }
    }
}
