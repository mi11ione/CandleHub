//
//  ViewExtension.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

extension View {
    func slideFadeIn(show: Bool, offset: Double = 10) -> some View {
        self.modifier(SlideFadeIn(show: show, offset: offset))
    }

    func backgroundStyle(cornerRadius: CGFloat = 20, opacity: Double = 0.6) -> some View {
        self.modifier(BackgroundStyle(cornerRadius: cornerRadius, opacity: opacity))
    }

    func backgroundColor(opacity: Double = 0.6) -> some View {
        self.modifier(BackgroundColor(opacity: opacity))
    }
}
