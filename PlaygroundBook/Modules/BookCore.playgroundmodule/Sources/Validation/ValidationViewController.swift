//
//  ValidationViewController.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 15/05/20.
//

import UIKit
import PlaygroundSupport
import SoundAnalysis
import AVKit
import SpriteKit

class ValidationViewController: UIViewController {
    
    var contentView: UIView?
    var trainingAccuracyLabel: UILabel?
    var scoreLabel: UILabel?
    var songsNumberLabel: UILabel?
    
    
    var score: Int?
    var numberSongs: Int?
    var outliers: Int?
    var trainingAccuracy: Int?
    
    var resultObserver: ResultsObserver?
    
    public let audioEngine = AVAudioEngine()
    
//    public var soundClassifier: Classifier?
    
    
    public var streamAnalyzer: SNAudioStreamAnalyzer!
    public let queue = DispatchQueue(label: "com.mitrevski.musicinstruments")
    
    override func viewDidLoad() {
        
        if let contentView = getView(with: "ContentView", inside: self.view) {

            self.contentView = contentView
            
            if let skView = getSKView(with: "SKView", inside: contentView) {
                
                // Load the SKScene
                let scene = ValidationScene(size: skView.bounds.size)
                scene.scaleMode = .aspectFill
                scene.reloadInputViews()
                scene.backgroundColor = .darkGray

                
                // Present the scene
                skView.presentScene(scene)
                
                // Add Sub Parameters
                skView.ignoresSiblingOrder = true
                skView.showsFPS = true
                skView.showsNodeCount = true
            }
            
            if let label = getLabel(with: "Training", inside: contentView) {
                
                self.trainingAccuracyLabel = label
                
            }
            
            if let label2 = getLabel(with: "Score", inside: contentView) {
                
                self.scoreLabel = label2
                
            }
            
            if let label3 = getLabel(with: "Songs", inside: contentView) {
                
                self.songsNumberLabel = label3
                
            }
            
            startAllLabels()
            
        }
        
    }
    
    func getView(with identifier: String, inside view: UIView) -> UIView? {
        
        let subview = view.subviews.filter { $0.restorationIdentifier == identifier }.first
        
        return subview
    }
    
    func getLabel(with identifier: String, inside view: UIView) -> UILabel? {
        
        let subview = view.subviews.filter { $0.restorationIdentifier == identifier }.first as? UILabel
        
        return subview
    }
    
    func getSKView(with identifier: String, inside view: UIView) -> SKView? {
        
        let subview = view.subviews.filter { $0.restorationIdentifier == identifier }.first as? SKView
        
        return subview
    }
    
    
    func startAllLabels() {
        
        if let keyValue = PlaygroundKeyValueStore.current["Score"],
            case .integer(let animalType) = keyValue {
            self.scoreLabel?.text = "Your Score: " + String(animalType)
            self.score = animalType
        }
        
        if let keyValue = PlaygroundKeyValueStore.current["Training"],
            case .integer(let animalType) = keyValue {
            self.trainingAccuracyLabel?.text = "Training Accuracy: " + String(animalType)
            self.trainingAccuracy = animalType
        }
        
        if let keyValue = PlaygroundKeyValueStore.current["Songs"],
            case .integer(let animalType) = keyValue {
            self.songsNumberLabel?.text = "Number of Songs: " + String(animalType)
            self.numberSongs = animalType
        }
    }
    
    
    func verifyResults() {
        
        var goodPerformace = false
        
        if let score = score {
            if score > 200 {
                goodPerformace = true
            }
        } else {
            
        }
        
        if let songs = numberSongs {
            if songs >= 1 {
                goodPerformace = true
            }
        } else {
            
        }
        
        if let outliers = outliers {
            if outliers <= 10 {
                goodPerformace = true
            } else {
                goodPerformace = false
            }
        } else {
            
        }
        
        if let training = trainingAccuracy {
            if training > 80 {
                goodPerformace = true
            } else {
                goodPerformace = false
            }
        } else {
            
            
        }
        
        if goodPerformace {
            ACTManager.shared.run(.correct, onNode: ValidationScene.sharedNode)
            ValidationScene.character.trainingGuitar()
        } else {
            ACTManager.shared.run(.wrong, onNode: ValidationScene.sharedNode)
            ValidationScene.character.trainingGuitar()

        }
    }
    
}


extension ValidationViewController: PlaygroundLiveViewMessageHandler {
    
    public func receive(_ message: PlaygroundValue) {
        
        switch message {
            
        case .boolean(let value):
            print(value)
            verifyResults()
            
        default:
            break
            
        }
            
    }
}



