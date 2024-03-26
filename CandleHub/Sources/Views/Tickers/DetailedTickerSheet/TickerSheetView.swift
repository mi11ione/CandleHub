import SwiftUI

struct TickerSheetView: View {
    @State var viewModel: TickerSheetViewModel
    
    var ticker: TickerMOEX {
        viewModel.ticker
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                VStack {
                    ZStack {
                        Rectangle()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                            .frame(height: 65)
                            .opacity(0.15)
                        HStack {
                            VStack(alignment: .leading) {
                                Text(ticker.subTitle)
                                    .font(.title2)
                                    .bold()
                                Text("$\(ticker.title)")
                                    .font(.title3)
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text(ticker.price.description).font(.title)
                                Text("\(String(format: "%.2f", ticker.priceChange.amount)) ₽")
                                    .font(.title3)
                                    .foregroundColor(priceChangeColor)
                            }
                        }
                        .padding(.horizontal)
                    }
                    CandleStickChart(
                        candles: viewModel.candles,
                        tickerTitle: ticker.title
                    )
                }
                .padding()
            }
            .frame(height: 360)
            .padding()

            Text("IdentifiedPatterns").font(.title).bold().padding(.horizontal)
            Spacer()
        }
        .padding(.top)
    }

    private var priceChangeColor: Color {
        if ticker.priceChange.amount > 0 {
            return .green
        } else if ticker.priceChange.amount < 0 {
            return .red
        } else {
            return .primary
        }
    }
}

#Preview {
    TabBarView()
}
