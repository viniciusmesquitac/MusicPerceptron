////
////  Validation+SNManager.swift
////  BookCore
////
////  Created by Vinicius Mesquita on 16/05/20.
////
//
//import AVKit
//import SoundAnalysis
//
//extension ValidationViewController {
//    
//    func startAudioEngine() {
//        audioEngine.prepare()
//        do {
//            try audioEngine.start()
//        } catch {
//            showAudioError()
//        }
//    }
//    
//   func createClassificationRequest() {
//        
//        do {
//            
////            guard let model = soundClassifier?.model else { return }
//            
////            let request = try SNClassifySoundRequest(mlModel: model)
//            
////            try streamAnalyzer?.add(request, withObserver: self)
//            
//        } catch {
//            fatalError("error adding the classification request")
//        }
//    }
//    
//    func prepareForRecording() {
//        
//        let inputNode = audioEngine.inputNode
//        
//        let recordingFormat = inputNode.outputFormat(forBus: 0)
//        
//        streamAnalyzer = SNAudioStreamAnalyzer(format: recordingFormat)
//        
//        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) {
//            [unowned self] (buffer, when) in
//            
//            self.queue.async {
//                
//                self.streamAnalyzer?.analyze(buffer,
//                                             atAudioFramePosition: when.sampleTime)
//            }
//        }
//        startAudioEngine()
//    }
//}
//
//extension ValidationViewController {
//    
//    func showAlert(title: String, message: String) {
//        let alert = UIAlertController(title: title,
//                                      message: message,
//                                      preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(action)
//        self.present(alert, animated: true, completion: nil)
//    }
//    
//    func showAudioError() {
//        let errorTitle = "Audio Error"
//        let errorMessage = "Recording is not possible at the moment."
//        self.showAlert(title: errorTitle, message: errorMessage)
//    }
//    
//}
