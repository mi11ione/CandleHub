import SwiftUI

struct TickersViewSwitch: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showingAlert = false

    var body: some View {
        Button(action: {
            showingAlert = true
        }) {
            HStack {
                Image(systemName: "bolt.horizontal.fill")
                Text("Crypto")
            }
            .font(.headline).bold()
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .padding(.horizontal, 14)
            .padding(.vertical, 7)
            .background(.thinMaterial)
            .cornerRadius(10)
        }
        .padding(.top, 12)
        .padding(.trailing, 20)
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Coming soon..."),
                dismissButton: .default(Text("Okay"))
            )
        }
    }
}
