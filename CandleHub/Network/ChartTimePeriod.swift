import Foundation

enum ChartTimePeriod: Int {
    case day
    case week
    case month
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
        case .day, .week:
            return .month
        case .month:
            return .year
        }
    }

    var unitForPatternView: Calendar.Component {
        switch self {
        case .day, .week, .month:
            return .hour
        }
    }

    var timePeriodForPatternView: Double {
        switch self {
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
        case .day:
            return 86400.0
        case .week:
            return 604_800.0
        case .month:
            return 2_666_000.0
        }
    }
}
