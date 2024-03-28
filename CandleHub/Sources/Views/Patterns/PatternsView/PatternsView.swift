import SwiftUI

struct PatternsView: View {
    @StateObject private var viewModel: PatternsGridViewModel = PatternsGridViewModel(fetcher: TradingDataNetworkFetcher())
    @State private var selectedOption: Option = .bigPatterns
    @State private var selectedFilter: String = ""

    private let filterKeys = ["single", "double", "triple", "complex"]

    private func filterKey(from localizedFilter: String) -> String {
        filterKeys.first(where: { NSLocalizedString($0, comment: "") == localizedFilter }) ?? ""
    }

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Patterns")
                        .font(.largeTitle).bold()
                        .padding([.top, .leading])

                    Spacer()
                    PatternsViewSwitch(selectedOption: $selectedOption)
                        .padding(.top, 13)
                }
            }
            ScrollView {
                Filters(selectedFilter: $selectedFilter)
                PatternsGridView(
                    patterns: selectedFilter.isEmpty ? viewModel.patterns : viewModel.patterns.filter { $0.filter == filterKey(from: selectedFilter) },
                    selectedOption: selectedOption,
                    gridWidth: viewModel.gridWidth(for: selectedOption)
                )
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchPatterns()
            }
        }
    }
}
