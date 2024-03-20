import SwiftUI

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    @State private var selectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Candles")
                .tabItem {
                    Label("Candles", systemImage: "alternatingcurrent")
                }
                .tag(0)

            NavigationStack(path: $navigationPath) {
                mainContent
                    .navigationDestination(for: String.self) { value in
                        Text(value)
                    }
            }
            .tabItem {
                Label("Tickers", systemImage: "dollarsign.arrow.circlepath")
            }
            .tag(1)

            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "checkmark.shield.fill")
                }
                .tag(2)
        }
    }

    private var mainContent: some View {
        ZStack {
            VStack {
                Filters()
                TickersView()
            }
            .navigationBarTitle("CandleHub")
            .padding(.top, 5)
            .navigationBarItems(trailing: tickerSwitchButton)
        }
    }

    private var tickerSwitchButton: some View {
        Button(action: {
            // todo
        }) {
            Image(systemName: "bolt.circle")
                .font(.title)
                .imageScale(.medium)
                .foregroundColor(.black)
        }
        .padding(.top, 87)
    }
}

#Preview {
    ContentView()
}
