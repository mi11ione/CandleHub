//
//  Model.swift
//  CandleHub
//
//  Created by Кирилл Кошкарёв on 22.03.2024.
//

import SwiftUI
import CoreML

func loadModel() {
    
    guard let modelURL = Bundle.main.url(forResource: "CloseRegressionModel", withExtension: "mlmodel") else {
        fatalError("Failed to find YourModel.mlmodel in main bundle")
    }
    
    do {
        let mlModel = try MLModel(contentsOf: modelURL)
        
        var modelInput = OpenRegressionModelInput(open: 10.0, high: 10.0, low: 10.0, close: 10.0, volume: 10.0, open__d_1_: 10.0, high__d_1_: 10.0, low__d_1_: 10.0, close__d_1_: 10.0, volume__d_1_: 10.0, open__d_2_: 10.0, high__d_2_: 10.0, low__d_2_: 10.0, close__d_2_: 10.0, volume__d_2_: 10.0, open__d_3_: 10.0, high__d_3_: 10.0, low__d_3_: 10.0, close__d_3_: 10.0, volume__d_3_: 10.0, open__d_4_: 10.0, high__d_4_: 10.0, low__d_4_: 10.0, close__d_4_: 10.0, volume__d_4_: 10.0, open__d_5_: 10.0, high__d_5_: 10.0, low__d_5_: 10.0, close__d_5_: 10.0, volume__d_5_: 10.0)
        
        let prediction = try mlModel.prediction(from: modelInput)
        
//        return prediction
        
    } catch {
        
//        return "Bruuuh"
        
    }
    
    
}
