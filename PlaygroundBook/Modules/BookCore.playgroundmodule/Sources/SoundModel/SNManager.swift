//
//  SNManager.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 15/05/20.
//

import SoundAnalysis
import AVKit
import PlaygroundSupport

class SNManager {
    
    var observer: ResultsObserver!
    var audioEngine: AVAudioEngine!
    var inputFormat: AVAudioFormat!
    var inputBus: AVAudioNodeBus!
    
    var streamAnalyzer: SNAudioStreamAnalyzer?
    
//    let queue = DispatchQueue(label: "com.mitrevski.musicinstruments")
    
    
    init(with observer: ResultsObserver) {

        startAudioEngine()

        streamAnalyzer = SNAudioStreamAnalyzer(format: inputFormat)
        self.observer = observer

    }
    
    
    func startAudioEngine() {
        // Create a new audio engine.
        audioEngine = AVAudioEngine()

        // Get the native audio format of the engine's input bus.
        inputBus = AVAudioNodeBus(0)
        inputFormat = audioEngine.inputNode.inputFormat(forBus: inputBus)
        
        do {
            // Start the stream of audio data.
            try audioEngine.start()
        } catch {
            print("Unable to start AVAudioEngine: \(error.localizedDescription)")
        }
    }
    
    
//    private func createClassificationRequest() {
//        
//        do {
//            
//            let request = try SNClassifySoundRequest(mlModel: Classifier().model)
//            
//            try streamAnalyzer?.add(request, withObserver: self)
//            
//        } catch {
//            fatalError("error adding the classification request")
//        }
//    }
//    
//    private func prepareForRecording() {
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
//                                            atAudioFramePosition: when.sampleTime)
//            }
//        }
//        startAudioEngine()
//    }
    
}
