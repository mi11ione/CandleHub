import SwiftUI

extension View {
    func backgroundStyle(cornerRadius: CGFloat = 20, opacity: Double = 0.6) -> some View {
        modifier(BackgroundStyle(cornerRadius: cornerRadius, opacity: opacity))
    }
}
