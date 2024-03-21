//
//  TickersViewSwitch.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct TickersViewSwitch: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedOptions: Set<String> = []

    var body: some View {
        Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "bolt.horizontal.fill")
                    Text("Crypto")
                }
                .font(.headline).bold()
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .background(.thinMaterial)
                .cornerRadius(10)
            }
            .padding(.top, 12)
            .padding(.trailing)
        }
    }
