////
////  Validation+SNResultsObserving.swift
////  BookCore
////
////  Created by Vinicius Mesquita on 16/05/20.
////
//
//import SoundAnalysis
//import AVKit
//
//extension ValidationViewController: SNResultsObserving {
//    
//    func request(_ request: SNRequest, didProduce result: SNResult) {
//        guard let result = result as? SNClassificationResult else { return }
//        var temp = [(label: String, confidence: Float)]()
//        let sorted = result.classifications.sorted { (first, second) -> Bool in
//            return first.confidence > second.confidence
//        }
//        for classification in sorted {
//            let confidence = classification.confidence * 100
//            if confidence > 5 {
//                temp.append((label: classification.identifier, confidence: Float(confidence)))
//            }
//        }
//        
//        let lastLabel = temp.last?.label
//        
//        self.percentAcuracyLabel?.text = lastLabel
//        
//    }
//    
//}
