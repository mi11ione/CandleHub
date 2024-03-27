import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var nameKey: String
    var icon: String
    var color: Color
    var selection: Tab

    var name: String {
        NSLocalizedString(nameKey, tableName: nil, bundle: .main, value: "", comment: "")
    }
}

var tabItems = [
    TabItem(nameKey: "Patterns", icon: "alternatingcurrent", color: .teal, selection: .patterns),
    TabItem(nameKey: "Tickers", icon: "dollarsign.arrow.circlepath", color: .red, selection: .tickers),
    TabItem(nameKey: "About", icon: "checkmark.shield.fill", color: .blue, selection: .about),
]
