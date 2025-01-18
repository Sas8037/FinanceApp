//
//  ContentView.swift
//  FinanceApp
//
//  Created by Saul Saavedra on 1/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedItem: SidebarItem? = .home
    
    var body: some View {
        NavigationSplitView {
            sidebar
        } detail: {
            detailView
        }
    }
    
    // Left Side Bar
    private var sidebar: some View {
        List(SidebarItem.allCases, selection: $selectedItem) { item in
            Text(item.rawValue)
                .tag(item)
        }
        .navigationTitle("Dashboard")
        .listStyle(.sidebar)
    }
    
    // Main Area
    @ViewBuilder
    private var detailView: some View {
        switch selectedItem {
        case .home:
            HomeView()
        case .creditScore:
            CreditScoreView()
        case .transactions:
            Text("Transactions")
        case .settings:
            Text("Settings")
        case .none:
            Text("Select an item from the sidebar")
        }
    }
    
}

#Preview {
    ContentView()
}
