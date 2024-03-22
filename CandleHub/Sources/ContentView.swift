import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .tickers

    var body: some View {
        NavigationStack {
            ZStack {
                Group {
                    switch selectedTab {
                    case .tickers:
                        TickersView(tickersArray: .init())
                    case .patterns:
                        PatternsView()
                    case .settings:
                        SettingsView()
                    }
                }
                TabBar()
            }
        }
    }
}

#Preview {
    ContentView()
}
