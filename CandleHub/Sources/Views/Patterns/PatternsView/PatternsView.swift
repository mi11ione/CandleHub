import SwiftUI

struct PatternsView: View {
    @State private var selectedOption: Option = .bigPatterns
    @State private var selectedPattern: Pattern?
    @State private var selectedFilter: String = ""

    private var patterns: [Pattern] = PatternsRepository.patterns

    private let filterKeys = ["Single", "Double", "Triple", "Complex"]

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
                    selectedOption: $selectedOption
                )
            }
        }
    }
}
