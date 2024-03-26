import SwiftUI

struct PatternsGridViewModel {
    let patterns: [Pattern]

    init() {
        patterns = PatternsRepository.patterns
    }
}
