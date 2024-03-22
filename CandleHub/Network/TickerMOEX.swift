import Foundation

class TickerMOEX: Hashable, ObservableObject {
    @Published var title: String
    @Published var subTitle: String
    @Published var price: Money
    @Published var priceChange: Money
    @Published var tickerGraph: String?
    @Published var tickerImage: String?
    
    init(title: String, subTitle: String, price: Money, priceChange: Money, tickerGraph: String? = nil, tickerImage: String? = nil) {
        self.title = title
        self.subTitle = subTitle
        self.price = price
        self.priceChange = priceChange
        self.tickerGraph = tickerGraph
        self.tickerImage = tickerImage
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(subTitle)
        hasher.combine(price)
        hasher.combine(priceChange)
        hasher.combine(tickerGraph)
        hasher.combine(tickerImage)
    }

    static func == (lhs: TickerMOEX, rhs: TickerMOEX) -> Bool {
        lhs.title == rhs.title &&
        lhs.subTitle == rhs.subTitle &&
        lhs.price == rhs.price &&
        lhs.priceChange == rhs.priceChange &&
        lhs.tickerGraph == rhs.tickerGraph &&
        lhs.tickerImage == rhs.tickerImage
    }
}
