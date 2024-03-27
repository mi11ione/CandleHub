import SwiftUI

struct TabBarView: View {
    @State private var initialTab: Tab = .tickers

    var body: some View {
        NavigationStack {
            ZStack {
                Group {
                    switch initialTab {
                    case .tickers:
                        TickersView()
                    case .patterns:
                        PatternsView()
                    case .about:
                        AboutView()
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
