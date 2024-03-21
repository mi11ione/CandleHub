//
//  PatternsView.swift
//  CandleHub
//
//  Created by mi11ion on 21/3/24.
//

import SwiftUI

struct PatternsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private var data  = Array(1...100)
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Patterns")
                        .font(.largeTitle).bold()
                        .padding([.top, .leading])
                    
                    Spacer()
                    PatternsViewSwitch()
                        .padding(.top, 13)
                }
                Filters()
            }
        
            ScrollView {
                LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                    ForEach(data, id: \.self) { item in
                        VStack {
                            Text(String(item))
                                .frame(width: 160, height: 160, alignment: .center)
                                .background(Rectangle().fill(Material.thin))
                                .cornerRadius(20)
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .font(.title)
                            
                            Text("Subtitle \(item)")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .font(.body)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView().preferredColorScheme(.dark)
}
#Preview {
    ContentView().preferredColorScheme(.light)
}
