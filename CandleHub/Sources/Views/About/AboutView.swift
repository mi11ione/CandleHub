import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("About")
                        .font(.largeTitle).bold()
                        .padding([.top, .leading])
                    Spacer()
                }
            }
            ScrollView {
                LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {}
                            .padding()
                    }
                }
            }
        }
    }

    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 300)),
    ]
}
