import SwiftUI

struct CreditScoreView: View {
    @StateObject private var viewModel = CreditScoreViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            } else if let score = viewModel.currentScore {
                Text("Your Credit Score: \(score.score)")
                    .font(.largeTitle)
                    .padding()
                Text("Last updated: \(score.lastUpdated, style: .date)")
                    .foregroundColor(.gray)
            } else {
                Text("No data available")
                    .padding()
            }
            
            Button (action: {
                viewModel.loadCreditScore(for: "dummyUserId123")
            }) {
                Text("Load Credit Score")
                    .padding()
            }
            .buttonStyle(.plain)
            .background(.red)
            .padding()
        }
        .padding()
    }
}

#Preview {
    CreditScoreView()
}
