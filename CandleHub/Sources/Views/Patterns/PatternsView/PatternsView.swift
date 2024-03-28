import SwiftUI

struct PatternsView: View {
    @State private var selectedOption: Option = .bigPatterns
    private var viewModel = PatternsGridViewModel(fetcher: TradingDataNetworkFetcher())
    @State private var patterns: [Pattern] = []
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
                    patterns: selectedFilter.isEmpty ? patterns : patterns.filter { $0.filter == filterKey(from: selectedFilter) },
                    selectedOption: $selectedOption,
                    viewModel: viewModel
                )
            }
        }
        .onAppear {
            Task {
                patterns = await viewModel.fetchPatterns() ?? []
            }
        }
    }
}
