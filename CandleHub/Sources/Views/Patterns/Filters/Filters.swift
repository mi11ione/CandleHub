import SwiftUI

struct Filters: View {
    let filterKeys = [
        "single",
        "double",
        "triple",
        "complex",
    ]

    var filters: [String] {
        filterKeys.map { NSLocalizedString($0, comment: "") }
    }

    @Binding var selectedFilter: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.self) { filter in
                    FilterButton(filter: filter, isSelected: .constant(filter == selectedFilter), onSelectionChange: { isSelected in
                        selectedFilter = isSelected ? filter : ""
                    })
                }
                Spacer()
            }
            .padding(.horizontal, 22)
        }
    }
}
