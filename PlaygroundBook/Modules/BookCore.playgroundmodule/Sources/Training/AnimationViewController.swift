//
//  AnimationViewController.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 14/05/20.
//

import UIKit
import SpriteKit
import PlaygroundSupport

public class AnimationViewController: UIViewController {
    
    var progressView: UIProgressView?
    var percentLabel: UILabel?
    
    public override func viewDidLoad() {
        
        if let contentView = getView(with: "ContentView", inside: self.view) {

            if let skView = getSKView(with: "SKView", inside: contentView) {
                
                // Load the SKScene
                let scene = AnimationScene(size: skView.bounds.size)
                scene.scaleMode = .aspectFill
                scene.reloadInputViews()
                scene.backgroundColor = .darkGray

                
                
                if let progressView = getProgressView(with: "ProgressView", inside: contentView) {
                    self.progressView = progressView
                    self.progressView?.progressTintColor = .black
                    self.progressView?.progress = 0.0
                }
                
                if let label = getLabel(with: "Label", inside: contentView) {
                               
                    self.percentLabel = label
                               
                }
                
                
                // Present the scene
                skView.presentScene(scene)
                
                // Add Sub Parameters
                skView.ignoresSiblingOrder = true
                skView.showsFPS = true
                skView.showsNodeCount = true
            }

        }
        
    }
    
    
    
    func getSKView(with identifier: String, inside view: UIView) -> SKView? {
        
        let subview = view.subviews.filter { $0.restorationIdentifier == identifier }.first as? SKView
        
        return subview
    }
    
    func getView(with identifier: String, inside view: UIView) -> UIView? {
        
        let subview = view.subviews.filter { $0.restorationIdentifier == identifier }.first
        
        return subview
    }
    
    func getProgressView(with identifier: String, inside view: UIView) -> UIProgressView? {
          
          let subview = view.subviews.filter { $0.restorationIdentifier == identifier }.first as? UIProgressView
          
          return subview
      }
    
    func getLabel(with identifier: String, inside view: UIView) -> UILabel? {
        
        let subview = view.subviews.filter { $0.restorationIdentifier == identifier }.first as? UILabel
        
        return subview
    }
    
    
    func runProgressView(interactions: Int) {
        let progress = Progress(totalUnitCount: 10)
        
        self.progressView?.progress = 0.0
        progress.completedUnitCount = 0

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            
            guard progress.isFinished == false else {
                timer.invalidate()
                return
            }
            
            if progress.completedUnitCount + 1 >= interactions {
                AnimationScene.character.removeAllActions()
                AnimationScene.character.idlePosition()
                timer.invalidate()
            }
            
            progress.completedUnitCount += 1
            
            self.progressView?.setProgress(Float(progress.fractionCompleted), animated: true)
            
            self.percentLabel?.text = "Training Accuracy: \(Int(progress.fractionCompleted * 100))%"
            
            PlaygroundKeyValueStore.current["Training"] = .integer(Int(progress.fractionCompleted * 100))

            
          }
    }
    
}


extension AnimationViewController: PlaygroundLiveViewMessageHandler {
    
    public func receive(_ message: PlaygroundValue) {
        
    switch message {
        
        case .data(let value):
            let jsonDecoder = JSONDecoder.init()
            do {
                let interaction = try jsonDecoder.decode(Interaction.self, from: value)
                
                self.runProgressView(interactions: interaction.totalIterations)
                
                switch interaction.instrument {
                case .guitar:
                    AnimationScene.character.trainingGuitar()
                case .piano:
                    AnimationScene.character.trainingAnimate()
                default:
                    AnimationScene.character.trainingGuitar()

                }
                
                
            } catch {
                
            }
            
        default:
            break
        }
        
    }
    
}


