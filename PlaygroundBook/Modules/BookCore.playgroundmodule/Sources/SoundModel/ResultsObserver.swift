//
//  ResultsObserver.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 15/05/20.
//

import Foundation
import SoundAnalysis

// Observer object that is called as analysis results are found.
class ResultsObserver : NSObject, SNResultsObserving {
    
    var delegate: ValidationLabelDelegate?

    var percent: String = "" {
        
        didSet {
            delegate?.didUpdatePercent(text: percent)
        }
    }
    
    var confidence: String = "" {
        
        didSet {
            delegate?.didUpdateConfidence(text: confidence)
        }
    }
    
    func request(_ request: SNRequest, didProduce result: SNResult) {
        
        // Get the top classification.
        guard let result = result as? SNClassificationResult,
            let classification = result.classifications.first else { return }
        
        // Determine the time of this result.
        let formattedTime = String(format: "%.2f", result.timeRange.start.seconds)
        print("Analysis result for audio at time: \(formattedTime)")
        
        let confidence = classification.confidence * 100.0
        let percent = String(format: "%.2f%%", confidence)

        // Print the result as Instrument: percentage confidence.
        print("\(classification.identifier): \(percent) confidence.\n")
        
        self.confidence = classification.identifier
        
        self.percent = percent
    }
    
    func request(_ request: SNRequest, didFailWithError error: Error) {
        print("The the analysis failed: \(error.localizedDescription)")
    }
    
    func requestDidComplete(_ request: SNRequest) {
        print("The request completed successfully!")
    }
}


protocol ValidationLabelDelegate {
    
    func didUpdatePercent(text: String)
    func didUpdateConfidence(text: String)
    
}
