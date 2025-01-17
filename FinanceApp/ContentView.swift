//
//  ContentView.swift
//  FinanceApp
//
//  Created by Saul Saavedra on 1/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            sidebar
        } detail: {
            detailView
        }
    }
    
    // Left Side Bar
    private var sidebar: some View {
        Text("Sidebar")
    }
    
    // Main Area
    private var detailView: some View {
        Text("Main Area")
    }
    
}

#Preview {
    ContentView()
}
