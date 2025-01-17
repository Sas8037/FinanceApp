//
//  CreditScoreViewModel.swift
//  FinanceApp
//
//  Created by Saul Saavedra on 1/16/25.
//

import Foundation
import Combine

class CreditScoreViewModel: ObservableObject {
    @Published var currentScore: CreditScore?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let calculator: CreditScoreCalculator
    private var cancellables = Set<AnyCancellable>()
    
    init(calculator: CreditScoreCalculator = CreditScoreCalculator()) {
        self.calculator = calculator
    }
    
    func loadCreditScore(for userId: String) {
        isLoading = true
        errorMessage = nil

        calculator.fetchCreditScore(for: userId) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                switch result {
                case .success(let score):
                    self.currentScore = score
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
