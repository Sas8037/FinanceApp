//
//  HomeView.swift
//  FinanceApp
//
//  Created by Saul Saavedra on 1/17/25.
//

import SwiftUI

struct HomeView: View {
    @State private var widgets: [DashboardWidget] = [
        DashboardWidget(type: .creditScore),
        // DashboardWidget(type: .budget),
        // DashboardWidget(type: .transactions)
    ]
    
    @State private var isEditing = false

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(isEditing ? "Done" : "Edit") {
                    isEditing.toggle()
                }
                .padding()
                .buttonStyle(.plain)
                .background(.green)
                .cornerRadius(10)
            }
            .padding()
            
            List {
                ForEach(widgets.indices, id: \.self) { index in
                    HStack {
                        if isEditing {
                            // Show "move up/down" buttons
                            Button(action: { moveUp(index) }) {
                                Image(systemName: "chevron.up")
                            }.disabled(index == 0)

                            Button(action: { moveDown(index) }) {
                                Image(systemName: "chevron.down")
                            }.disabled(index == widgets.endIndex - 1)
                            
                            Button(action: { deleteItem(index) }) {
                                Image(systemName: "trash")
                            }
                            .foregroundColor(.red)
                        }

                        // Your widget content here
                        WidgetRowView(widget: widgets[index])
                    }
                }
            }
            .frame(minWidth: 300, minHeight: 200)
        }
    }

    // MARK: - Helpers

    private func moveUp(_ index: Int) {
        guard index > 0 else { return }
        widgets.swapAt(index, index - 1)
    }

    private func moveDown(_ index: Int) {
        guard index < widgets.count - 1 else { return }
        widgets.swapAt(index, index + 1)
    }

    private func deleteItem(_ index: Int) {
        widgets.remove(at: index)
    }
}

struct WidgetRowView: View {
    let widget: DashboardWidget

    var body: some View {
        switch widget.type {
        case .creditScore:
            Text("Credit Score Widget")
        // case .budget:
            // Text("Budget Widget")
        // case .transactions:
            // Text("Transactions Widget")
        // case .upcomingBills:
            // Text("Upcoming Bills Widget")
        }
    }
}

#Preview {
    HomeView()
}
