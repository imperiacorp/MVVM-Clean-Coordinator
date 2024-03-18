//
//  FirstTabRootView.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import SwiftUI

struct FirstTabRootView: View {
    
    @ScaledMetric private var buttonPadding: CGFloat = 8.0
    @ScaledMetric private var inverseHorizontalPadding: CGFloat = 8.0
    
    @ObservedObject var viewModel: FirstTabRootViewModel
    
    var body: some View {
        ZStack {
          VStack(alignment: .center, spacing: 24.0) {
            Button(action: self.viewModel.signInOrOut) {
              Text("Sign In")
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .padding(self.buttonPadding)
                .frame(maxWidth: .infinity, minHeight: 54.0)
                .contentShape(Rectangle())
            }
            .buttonStyle(.bordered)
            .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
            
            Button(action: self.viewModel.pulse) {
              Text("Pulse")
                .padding(self.buttonPadding)
                .frame(maxWidth: .infinity, minHeight: 54.0)
                .contentShape(Rectangle())
            }
            .buttonStyle(.bordered)
          }
          .padding([.leading, .trailing], max(56.0 - self.inverseHorizontalPadding, 4.0))
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    FirstTabRootView(viewModel: FirstTabRootViewModel())
}
