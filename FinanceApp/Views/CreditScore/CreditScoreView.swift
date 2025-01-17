//
//  CreditScoreView.swift
//  FinanceApp
//
//  Created by Saul Saavedra on 1/16/25.
//

import SwiftUI

struct CreditScoreView: View {
    @StateObject private var viewModel = CreditScoreViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else {
                Text("No data available")
                    .padding()
            }
            
            Button (action: {
                viewModel.loadingCreditScore()
            }) {
                Text("Load Credit Score")
                    .padding()
            }
            .buttonStyle(.plain)
            .background(.red)
            .padding()
        }
        .padding()
    }
}

#Preview {
    CreditScoreView()
}
