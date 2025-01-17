//
//  CreditScoreViewModel.swift
//  FinanceApp
//
//  Created by Saul Saavedra on 1/16/25.
//

import Foundation

class CreditScoreViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func loadingCreditScore() {
        isLoading = true
        errorMessage = nil
    }
}
