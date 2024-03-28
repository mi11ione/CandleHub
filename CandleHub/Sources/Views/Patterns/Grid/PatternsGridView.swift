import SwiftUI

struct PatternsGridView: View {
    var patterns: [Pattern]
    @Binding var selectedOption: Option
    @State private var selectedPattern: Pattern?
    var viewModel: PatternsGridViewModel

    var body: some View {
        LazyVGrid(columns: viewModel.adaptiveColumn(for: selectedOption), spacing: 20) {
            ForEach(patterns, id: \.id) { pattern in
                VStack {
                    PatternStickChart(pattern: pattern, gridWidth: viewModel.gridWidth(for: selectedOption))
                        .background(Material.thin)
                        .cornerRadius(30)

                    Text(pattern.name)
                        .padding(.vertical, 8)
                }
                .onTapGesture {
                    selectedPattern = pattern
                }
            }
            .sheet(item: $selectedPattern) { pattern in
                PatternSheetView(pattern: pattern, gridWidth: 300)
            }
        }
        .padding([.top, .horizontal])
    }
}
