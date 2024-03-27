import SwiftUI

struct PatternsGridView: View {
    @Environment(\.colorScheme) var colorScheme
    var patterns: [Pattern]
    @Binding var selectedOption: Option
    @State private var selectedPattern: Pattern?

    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: gridWidth(for: selectedOption)))]
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(patterns, id: \.id) { pattern in
                    VStack {
                        PatternStickChart(pattern: pattern, gridWidth: gridWidth(for: selectedOption))
                            .background(Rectangle().fill(Material.thin))
                            .cornerRadius(30)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title)
                        
                        Text("\(pattern.name)")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.body)
                            .padding(.top, -6)
                            .padding(.bottom, -6)
                    }
                    .frame(height: 166)
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
