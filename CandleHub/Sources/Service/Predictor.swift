//
//  Model.swift
//  CandleHub
//
//  Created by Кирилл Кошкарёв on 22.03.2024.
//

import CoreML
import SwiftUI

struct CandlePredictor: Predictor {
    
    func predict(modelInput: OpenRegressionModelInput) ->  Double {
        guard let modelURL = Bundle.main.url(forResource: "OpenRegressionModel", withExtension: "mlmodelc") else {
            fatalError("Failed to find YourModel.mlmodel in main bundle")
        }
        
        do {
            
            let mlModel = try MLModel(contentsOf: modelURL)
            let prediction = try mlModel.prediction(from: modelInput)
            
            if let doublePrediction = prediction.featureValue(for: "open_awaited")?.doubleValue {
                return doublePrediction
            } else {
                fatalError("Failed to get double prediction from ML model")
            }
        } catch {
            fatalError("Error making prediction: \(error.localizedDescription)")
        }
        
    }
    
}

struct Predictions {
    let openModelInput: OpenRegressionModelInput
    let closeModelInput: CloseRegressionModelInput
    let highModelInput: HighRegressionModel_Input
    let lowModelInput: LowRegressionModelInput
    
}

protocol Predictor {
    
    func predict(modelInput: OpenRegressionModelInput) -> Double
    
}
