//
//  BackgroundColor.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct BackgroundColor: ViewModifier {
    var opacity: Double = 0.6
    var cornerRadius: CGFloat = 20
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        content
            .overlay(
                Color("Background")
                    .opacity(colorScheme == .dark ? opacity : 0)
                    .mask(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                    .blendMode(.overlay)
                    .allowsHitTesting(false)
            )
    }
}
