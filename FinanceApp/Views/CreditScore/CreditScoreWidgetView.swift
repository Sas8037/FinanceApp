//
//  CreditScoreWidgetView.swift
//  FinanceApp
//
//  Created by Saul Saavedra on 1/17/25.
//

import SwiftUI

struct CreditScoreWidgetView: View {
    @StateObject var viewModel = CreditScoreViewModel()
    
    var userId: String = "dummyUserId123"
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let score = viewModel.currentScore {
                Gauge(value: Double(score), in: 300...850) {
                    Text("Credit Score")
                } currentValueLabel: {
                    Text("\(score)")
                }
            }  else {
                Text("No Data")
            }
        }
        .padding()
        .frame(width: 200, height: 200)
        .onAppear {
            viewModel.loadCreditScore(for: userId)
        }
    }
}

#Preview {
    CreditScoreWidgetView()
}
