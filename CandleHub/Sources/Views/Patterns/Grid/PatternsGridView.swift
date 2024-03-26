import SwiftUI

struct PatternsGridView: View {
    @Environment(\.colorScheme) var colorScheme
    var viewModel: PatternsGridViewModel
    var patterns: [Pattern]
    @Binding var selectedOption: Option
    @State private var selectedPattern: Pattern?

    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: gridWidth(for: selectedOption.rawValue)))]
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(patterns, id: \.id) { item in
                VStack {
                    PatternStickChart(pattern: item, gridWidth: gridWidth(for: selectedOption.rawValue))
                        .background(Rectangle().fill(Material.thin))
                        .cornerRadius(30)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.title)

                    Text("\(item.name)")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.body)
                        .padding(.top, -6)
                        .padding(.bottom, -6)
                }
            }
        }
        .padding([.top, .horizontal])
    }

    private func gridWidth(for selectedOption: String) -> CGFloat {
        selectedOption == "Big patterns" ? 350 : 160
    }

    private func adaptiveColumn(for selectedOption: String) -> [GridItem] {
        [GridItem(.adaptive(minimum: gridWidth(for: selectedOption)))]
    }
}
