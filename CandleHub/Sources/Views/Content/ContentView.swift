import SwiftUI

struct ContentView: View {
    @StateObject var tickersViewModel = TickersViewModel()
    @AppStorage("selectedTab") var selectedTab: Tab = .tickers

    var body: some View {
        NavigationStack {
            ZStack {
                Group {
                    switch selectedTab {
                    case .tickers:
                        TickersView(tickersViewModel: tickersViewModel)
                    case .patterns:
                        PatternsView()
                    case .settings:
                        SettingsView()
                    }
                }
                TabBar()
            }
            .safeAreaInset(edge: .bottom) {
                VStack {}.frame(height: 60)
            }
        }
    }
}

#Preview {
    ContentView()
}
