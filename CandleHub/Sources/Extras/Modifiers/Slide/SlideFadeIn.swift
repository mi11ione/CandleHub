//
//  SlideFadeIn.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct SlideFadeIn: ViewModifier {
    var show: Bool
    var offset: Double

    func body(content: Content) -> some View {
        content
            .opacity(show ? 1 : 0)
            .offset(y: show ? 0 : offset)
    }
}
