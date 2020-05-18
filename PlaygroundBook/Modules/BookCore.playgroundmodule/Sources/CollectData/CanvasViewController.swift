//
//  CanvasViewController.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 13/05/20.
//

import UIKit
import PlaygroundSupport
import SpriteKit

public class CanvasViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    
    var stackView: UIStackView!
    var btnNotes: [UIButton]!
    var squareView: UIView!
    var gameManager: GameManager?
    var scoreLabel: UILabel!
    var outlierLabel: UILabel!
    
    private var isLiveViewStarted = false
    
    public override func awakeFromNib() {
        gameManager = GameManager()
        gameManager?.delegate = self
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        if let contentView = getView(with: "ContentView", inside: self.view) {
            
            if let skView = getSKView(with: "SKView", inside: contentView) {
                
                // Load the SKScene
                let scene = CanvasSKScene(size: skView.bounds.size)
                scene.scaleMode = .aspectFill
                scene.reloadInputViews()
                scene.backgroundColor = .darkGray
                
                // Load Buttons
                if let stackView = getStackView(with: "StackNotesView", inside: contentView) {

                    btnNotes = stackView.subviews as? [UIButton]
                    
                    for (index, btnNote) in btnNotes.enumerated() {
                        
                        gameManager?.configureButton(button: btnNote, index: index)
                        
                    }
                        
                }
                
                if let squareView = getView(with: "SquareView", inside: contentView) {
                    
                    self.squareView = squareView

                }
                
                
                if let scoreLabel = getLabel(with: "ScoreLabel", inside: contentView) {
                    self.scoreLabel = scoreLabel
                }
                
                if let outlierLabel = getLabel(with: "OutlierLabel", inside: contentView) {
                    self.outlierLabel = outlierLabel
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
    
    func getStackView(with identifier: String, inside view: UIView) -> UIStackView? {
        
        let subview = view.subviews.filter { $0.restorationIdentifier == identifier }.first as? UIStackView
        
        return subview
    }
    
    
    func getLabel(with identifier: String, inside view: UIView) -> UILabel? {
        
        let subview = view.subviews.filter { $0.restorationIdentifier == identifier }.first as? UILabel
        
        return subview
    }
    
}


extension CanvasViewController: PlaygroundLiveViewMessageHandler {
    
    public func receive(_ message: PlaygroundValue) {
        
        switch message {
            
            
        case .data(let value):
            let jsonDecoder = JSONDecoder.init()
            do {
                
                if !isLiveViewStarted {
                    isLiveViewStarted = true
                    let songs = try jsonDecoder.decode([Song].self, from: value)
                    PlaygroundKeyValueStore.current["Songs"] = .integer(songs.count)

                    gameManager?.startSongs(songs)
                    isLiveViewStarted = false
                }
                
            } catch {
                
            }
            
        default:
            break
        }
        
    }
    
}

extension CanvasViewController: GameManagerDelegate {
    
    func didUpdateOutlier(outlier: Int) {
        self.outlierLabel.text = "Outliers: \(String(outlier))"
        
        PlaygroundKeyValueStore.current["Outlier"] = .integer(outlier)
    }
    
    
    func didUpdateScore(score: Int) {
        self.scoreLabel.text = "Score: \(String(score))"
        
        PlaygroundKeyValueStore.current["Score"] = .integer(score)
    }
    
    func didUpdateSquare(color: UIColor) {
        
        if let _ = self.squareView {
            self.squareView.backgroundColor = color
        }
       
    }
    
    
    
}


