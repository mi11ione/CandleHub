import SwiftUI

struct BackgroundStyle: ViewModifier {
    var cornerRadius: CGFloat = 20
    var opacity: Double = 0.6
    @AppStorage("isLiteMode") var isLiteMode = true

    func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius)
            .modifier(OutlineOverlay(cornerRadius: cornerRadius))
    }
}
