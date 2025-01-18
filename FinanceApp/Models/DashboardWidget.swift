//
//  DashboardWidget.swift
//  FinanceApp
//
//  Created by Saul Saavedra on 1/17/25.
//

import Foundation

struct DashboardWidget: Identifiable, Equatable {
    let id = UUID()
    var type: WidgetType
    
    enum WidgetType: String, CaseIterable {
        case creditScore = "Credit Score"
        // case budget = "Budget"
        // case transactions = "Transactions"
        // case upcomingBills = "Upcoming Bills"
    }
}
