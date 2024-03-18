//
//  FirstTabDetailsView.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 13.02.2024.
//

import SwiftUI

struct FirstTabDetailsView: View {
    
    @ScaledMetric private var buttonPadding: CGFloat = 8.0
    @ScaledMetric private var inverseHorizontalPadding: CGFloat = 8.0
    
    @ObservedObject var viewModel: FirstTabDetailsViewModel
    
    var body: some View {
        ZStack {
          VStack(alignment: .center, spacing: 24.0) {
            
            Button(action: self.viewModel.back) {
              Text("Back")
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
    FirstTabDetailsView(viewModel: FirstTabDetailsViewModel())
}
