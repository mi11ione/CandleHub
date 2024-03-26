import CoreML
import SwiftUI

struct CandlePredictor: Predictor {
    static func predict(candles: [Candle]) -> [Double] {
        let candleSettings: [Double] = Adapter.adaptCandle(candles: candles)
        var readyPredict: [Double] = []

        // MARK: - OpenRegressionPredict

        let openModelInput = OpenRegressionModelInput(
            open: candleSettings[0], high: candleSettings[1], low: candleSettings[2],
            close: candleSettings[3], volume: candleSettings[4], open__d_1_: candleSettings[5],
            high__d_1_: candleSettings[6], low__d_1_: candleSettings[7], close__d_1_: candleSettings[8],
            volume__d_1_: candleSettings[9], open__d_2_: candleSettings[10], high__d_2_: candleSettings[11],
            low__d_2_: candleSettings[12], close__d_2_: candleSettings[13], volume__d_2_: candleSettings[14],
            open__d_3_: candleSettings[15], high__d_3_: candleSettings[16], low__d_3_: candleSettings[17],
            close__d_3_: candleSettings[18], volume__d_3_: candleSettings[19], open__d_4_: candleSettings[20],
            high__d_4_: candleSettings[21], low__d_4_: candleSettings[22], close__d_4_: candleSettings[23],
            volume__d_4_: candleSettings[24], open__d_5_: candleSettings[25], high__d_5_: candleSettings[26],
            low__d_5_: candleSettings[27], close__d_5_: candleSettings[28], volume__d_5_: candleSettings[29]
        )

        guard let firstModelURL = Bundle.main.url(forResource: "OpenRegressionModel", withExtension: "mlmodelc") else {
            fatalError("Failed to find YourModel.mlmodel in main bundle")
        }

        do {
            let mlModel = try MLModel(contentsOf: firstModelURL)
            let prediction = try mlModel.prediction(from: openModelInput)

            if let doublePrediction = prediction.featureValue(for: "open_awaited")?.doubleValue {
                readyPredict.append(doublePrediction)
            } else {
                fatalError("Failed to get double prediction from ML model")
            }
        } catch {
            fatalError("Error making prediction: \(error.localizedDescription)")
        }

        // MARK: - CloseRegressionPredict

        let closeModelInput = CloseRegressionModelInput(
            open: candleSettings[0], high: candleSettings[1], low: candleSettings[2],
            close: candleSettings[3], volume: candleSettings[4], open__d_1_: candleSettings[5],
            high__d_1_: candleSettings[6], low__d_1_: candleSettings[7], close__d_1_: candleSettings[8],
            volume__d_1_: candleSettings[9], open__d_2_: candleSettings[10], high__d_2_: candleSettings[11],
            low__d_2_: candleSettings[12], close__d_2_: candleSettings[13], volume__d_2_: candleSettings[14],
            open__d_3_: candleSettings[15], high__d_3_: candleSettings[16], low__d_3_: candleSettings[17],
            close__d_3_: candleSettings[18], volume__d_3_: candleSettings[19], open__d_4_: candleSettings[20],
            high__d_4_: candleSettings[21], low__d_4_: candleSettings[22], close__d_4_: candleSettings[23],
            volume__d_4_: candleSettings[24], open__d_5_: candleSettings[25], high__d_5_: candleSettings[26],
            low__d_5_: candleSettings[27], close__d_5_: candleSettings[28], volume__d_5_: candleSettings[29]
        )

        guard let secondModelURL = Bundle.main.url(forResource: "CloseRegressionModel", withExtension: "mlmodelc") else {
            fatalError("Failed to find YourModel.mlmodel in main bundle")
        }

        do {
            let mlModel = try MLModel(contentsOf: secondModelURL)
            let prediction = try mlModel.prediction(from: closeModelInput)

            if let doublePrediction = prediction.featureValue(for: "close_awaited")?.doubleValue {
                readyPredict.append(doublePrediction)
            } else {
                fatalError("Failed to get double prediction from ML model")
            }
        } catch {
            fatalError("Error making prediction: \(error.localizedDescription)")
        }

        // MARK: - HighRegressionPredict

        let highModelInput = HighRegressionModelInput(
            open: candleSettings[0], high: candleSettings[1], low: candleSettings[2],
            close: candleSettings[3], volume: candleSettings[4], open__d_1_: candleSettings[5],
            high__d_1_: candleSettings[6], low__d_1_: candleSettings[7], close__d_1_: candleSettings[8],
            volume__d_1_: candleSettings[9], open__d_2_: candleSettings[10], high__d_2_: candleSettings[11],
            low__d_2_: candleSettings[12], close__d_2_: candleSettings[13], volume__d_2_: candleSettings[14],
            open__d_3_: candleSettings[15], high__d_3_: candleSettings[16], low__d_3_: candleSettings[17],
            close__d_3_: candleSettings[18], volume__d_3_: candleSettings[19], open__d_4_: candleSettings[20],
            high__d_4_: candleSettings[21], low__d_4_: candleSettings[22], close__d_4_: candleSettings[23],
            volume__d_4_: candleSettings[24], open__d_5_: candleSettings[25], high__d_5_: candleSettings[26],
            low__d_5_: candleSettings[27], close__d_5_: candleSettings[28], volume__d_5_: candleSettings[29]
        )

        guard let thirdModelURL = Bundle.main.url(forResource: "HighRegressionModel", withExtension: "mlmodelc") else {
            fatalError("Failed to find YourModel.mlmodel in main bundle")
        }

        do {
            let mlModel = try MLModel(contentsOf: thirdModelURL)
            let prediction = try mlModel.prediction(from: highModelInput)

            if let doublePrediction = prediction.featureValue(for: "high_awaited")?.doubleValue {
                readyPredict.append(doublePrediction)
            } else {
                fatalError("Failed to get double prediction from ML model")
            }
        } catch {
            fatalError("Error making prediction: \(error.localizedDescription)")
        }

        // MARK: - LowRegressionPredict

        let lowModelInput = LowRegressionModelInput(
            open: candleSettings[0], high: candleSettings[1], low: candleSettings[2],
            close: candleSettings[3], volume: candleSettings[4], open__d_1_: candleSettings[5],
            high__d_1_: candleSettings[6], low__d_1_: candleSettings[7], close__d_1_: candleSettings[8],
            volume__d_1_: candleSettings[9], open__d_2_: candleSettings[10], high__d_2_: candleSettings[11],
            low__d_2_: candleSettings[12], close__d_2_: candleSettings[13], volume__d_2_: candleSettings[14],
            open__d_3_: candleSettings[15], high__d_3_: candleSettings[16], low__d_3_: candleSettings[17],
            close__d_3_: candleSettings[18], volume__d_3_: candleSettings[19], open__d_4_: candleSettings[20],
            high__d_4_: candleSettings[21], low__d_4_: candleSettings[22], close__d_4_: candleSettings[23],
            volume__d_4_: candleSettings[24], open__d_5_: candleSettings[25], high__d_5_: candleSettings[26],
            low__d_5_: candleSettings[27], close__d_5_: candleSettings[28], volume__d_5_: candleSettings[29]
        )

        guard let forthModelURL = Bundle.main.url(forResource: "LowRegressionModel", withExtension: "mlmodelc") else {
            fatalError("Failed to find YourModel.mlmodel in main bundle")
        }

        do {
            let mlModel = try MLModel(contentsOf: forthModelURL)
            let prediction = try mlModel.prediction(from: lowModelInput)

            if let doublePrediction = prediction.featureValue(for: "low_awaited")?.doubleValue {
                readyPredict.append(doublePrediction)
            } else {
                fatalError("Failed to get double prediction from ML model")
            }
        } catch {
            fatalError("Error making prediction: \(error.localizedDescription)")
        }

        return readyPredict
    }
}

protocol Predictor {
    static func predict(candles: [Candle]) -> [Double]
}
