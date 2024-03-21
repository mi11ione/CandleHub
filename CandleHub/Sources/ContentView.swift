import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .tickers

    var body: some View {
        NavigationStack {
            ZStack {
                Group {
                    switch selectedTab {
                    case .tickers:
                        TickersView()
                    case .patterns:
                        PatternsView()
                    case .settings:
                        SettingsView()
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    VStack {}.frame(height: 44)
                }
                TabBar()
            }
        }
    }
}

#Preview {
    ContentView().preferredColorScheme(.dark)
}

#Preview {
    ContentView().preferredColorScheme(.light)
}
