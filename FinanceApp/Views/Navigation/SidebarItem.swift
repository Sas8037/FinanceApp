//
//  SidebarItem.swift
//  FinanceApp
//
//  Created by Saul Saavedra on 1/17/25.
//

import Foundation

enum SidebarItem: String, CaseIterable, Identifiable {
    case home = "Home"
    case creditScore = "Credit Score"
    case transactions = "Transactions"
    case settings = "Settings"
    
    var id: String { rawValue }
}
