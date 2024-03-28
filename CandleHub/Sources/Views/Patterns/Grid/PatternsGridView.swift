import SwiftUI

struct PatternsGridView: View {
    var patterns: [Pattern]
    var selectedOption: Option
    @State private var selectedPattern: Pattern?
    var gridWidth: CGFloat

    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: gridWidth))], spacing: 20) {
            ForEach(patterns) { pattern in
                PatternCell(pattern: pattern, gridWidth: gridWidth)
                    .onTapGesture {
                        selectedPattern = pattern
                    }
            }
            .sheet(item: $selectedPattern) { pattern in
                PatternSheetView(pattern: pattern, gridWidth: 300)
            }
            .padding([.top, .horizontal])
        }
    }
}
