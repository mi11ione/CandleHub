struct Money: Hashable {
    let amount: Double
    let currency: Currency
}

extension Money {
    enum Currency {
        case rub
        case usd
    }
}

extension Money: CustomStringConvertible {
    var description: String {
        String(format: "%.2f \(currency.symbol)", amount)
    }
}

extension Money.Currency {
    var symbol: String {
        switch self {
        case .rub:
            return "₽"
        case .usd:
            return "$"
        }
    }
}
