import SwiftUI

struct PatternsGridView: View {
    @Environment(\.colorScheme) var colorScheme
    var patterns: [Pattern]
    @Binding var selectedOption: Option
    @State private var selectedPattern: Pattern?

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(patterns, id: \.id) { pattern in
                VStack {
                    PatternStickChart(pattern: pattern, gridWidth: gridWidth(for: selectedOption))
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

    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: gridWidth(for: selectedOption)))]
    }

    func gridWidth(for selectedOption: Option) -> CGFloat {
        switch selectedOption {
        case .bigPatterns:
            350
        case .smallPatterns:
            160
        }
    }

    func adaptiveColumn(for selectedOption: Option) -> [GridItem] {
        [GridItem(.adaptive(minimum: gridWidth(for: selectedOption)))]
    }
}
