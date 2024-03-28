import SwiftUI

struct PatternCell: View {
    var pattern: Pattern
    var gridWidth: CGFloat

    var body: some View {
        VStack {
            PatternStickChart(pattern: pattern, gridWidth: gridWidth)
                .background(Material.thin)
                .cornerRadius(30)

            Text(pattern.name)
                .padding(.vertical, -8)
        }
    }
}
