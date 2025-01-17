//
//  CreditScoreCalculator.swift
//  FinanceApp
//
//  Created by Saul Saavedra on 1/17/25.
//

import Foundation

class CreditScoreCalculator {
    func fetchCreditScore(for userId: String,
                          completion: @escaping (Result<CreditScore, Error>) -> Void) {
        // Simulate a network request
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            let mockScore = CreditScore(score: Int.random(in: 300...850))
            completion(.success(mockScore))
        }
    }
}
