//
//  PatternSheetView.swift
//  CandleHub
//
//  Created by 1 on 25.03.2024.
//

import SwiftUI

struct PatternSheetView: View {
    var pattern: Pattern
    var gridWidth: CGFloat

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                PatternStickChart(pattern: pattern, gridWidth: gridWidth)
            }
            .padding()
        }
        .frame(height: 360)
        .padding()

        Text(pattern.name)
            .font(.title)
            .bold()
            .padding(.horizontal)
        Text(pattern.info)
            .font(.subheadline)
            .padding(.horizontal)
            .padding(.top, 10)
        Spacer()
    }
}

#Preview {
    ContentView()
}
