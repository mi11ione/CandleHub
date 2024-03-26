import SwiftUI

struct PatternsGridView: View {
    @Environment(\.colorScheme) var colorScheme
    var viewModel: PatternsGridViewModel
    @Binding var selectedOption: String

    private var columns: [GridItem] {
        [GridItem(.adaptive(minimum: gridWidth(for: selectedOption)))]
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(viewModel.patterns, id: \.id) { item in
                VStack {
                    PatternStickChart(pattern: item, gridWidth: gridWidth(for: selectedOption))
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
