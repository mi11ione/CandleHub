import Foundation

enum ChartTimePeriod {
    case hour, day, week, month

    var queryItem: URLQueryItem {
        let value: String
        switch self {
        case .hour:
            value = "1"
        case .day:
            value = "24"
        case .week:
            value = "7"
        case .month:
            value = "31"
        }
        return URLQueryItem(name: "interval", value: value)
    }
}

extension ChartTimePeriod: Identifiable {
    var id: String {
        UUID().uuidString
    }
}

extension ChartTimePeriod: CaseIterable {}

extension ChartTimePeriod {
    var title: String {
        switch self {
        case .hour:
            return "Ч"
        case .day:
            return "Д"
        case .week:
            return "Н"
        case .month:
            return "M"
        }
    }

    var unit: Calendar.Component {
        switch self {
        case .hour:
            return .day
        case .day, .week:
            return .month
        case .month:
            return .year
        }
    }

    var unitForPatternView: Calendar.Component {
        switch self {
        case .hour, .day, .week, .month:
            return .hour
        }
    }

    var timePeriodForPatternView: Double {
        switch self {
        case .hour:
            return 60 * 60
        case .day:
            return 12 * 60 * 60
        case .week:
            return 3 * 24 * 60 * 60
        case .month:
            return 15 * 24 * 60 * 60
        }
    }

    var format: Date.FormatStyle {
        switch self {
        case .hour:
            return .dateTime.hour()
        case .day:
            return .dateTime.month()
        case .week:
            return .dateTime.week()
        case .month:
            return .dateTime.year()
        }
    }

    var interval: Double {
        switch self {
        case .hour:
            return 3600
        case .day:
            return 86400.0
        case .week:
            return 604_800.0
        case .month:
            return 2_666_000.0
        }
    }
}
