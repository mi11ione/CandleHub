import SwiftUI

struct ContentView: View {
    @State private var tickersViewModel = TickersViewModel(fetcher: TradingDataNetworkFetcher())
    @State private var initialTab: Tab = .tickers

    var body: some View {
        NavigationStack {
            ZStack {
                Group {
                    switch initialTab {
                    case .tickers:
                        TickersView(viewModel: $tickersViewModel)
                    case .patterns:
                        PatternsView()
                    case .settings:
                        SettingsView()
                    }
                }
                TabBar(selectedTab: $initialTab)
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
