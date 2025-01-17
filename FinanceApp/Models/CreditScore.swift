//
//  CreditScore.swift
//  FinanceApp
//
//  Created by Saul Saavedra on 1/17/25.
//

import Foundation

struct CreditScore: Identifiable, Codable {
    let id: UUID
    var score: Int
    var lastUpdated: Date

    init(score: Int, lastUpdated: Date = Date()) {
        self.id = UUID()
        self.score = score
        self.lastUpdated = lastUpdated
    }
}
