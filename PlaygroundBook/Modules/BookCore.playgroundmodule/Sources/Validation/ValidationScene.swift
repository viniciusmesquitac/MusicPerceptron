
//  CanvasSKScene.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 13/05/20.
//

import SpriteKit
import UIKit

public class ValidationScene: SKScene {
    
    var titleLabel = SKLabelNode()
    var shapeButton = SKShapeNode()
    
    static let character = Joe()
    
    static let sharedNode = SKNode()
    
    override public func didMove(to view: SKView) {
        addChild(ValidationScene.sharedNode)
        ValidationScene.character.stopedPostion()
        loadCharacter(ValidationScene.character)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let _ = ValidationScene.character.action(forKey: "Training") {
            ValidationScene.character.removeAllActions()
            ValidationScene.character.idlePosition()
        } else {
            ValidationScene.character.trainingAnimate()
        }

    }
    
    func loadNoteButton(label: String, position: CGPoint) {
        let noteLabel = SKLabelNode(text: label)

        self.shapeButton = SKShapeNode(rectOf: CGSize(width: 125, height: 50))
        self.shapeButton.fillColor = .black
        self.shapeButton.position = position
        self.addChild(shapeButton)


        noteLabel.fontSize = 12
        noteLabel.fontColor = .white
        noteLabel.fontName = "Futura-Bold"
        noteLabel.verticalAlignmentMode = .center
        noteLabel.horizontalAlignmentMode = .center
        noteLabel.position = CGPoint(x: shapeButton.frame.width, y: shapeButton.frame.height)
        shapeButton.addChild(noteLabel)
    }
    
    func loadCharacter(_ player: SKSpriteNode) {
        
        let startPointX = frame.width / 2
        let startPointY = frame.height / 2
        
        player.size = CGSize(width: 200, height: 400.0)
        player.zPosition = 1
        player.name = "Joe"
        player.position = CGPoint(x: startPointX, y: startPointY)
        addChild(player)
    }
    
    
    func loadTextLabel() {
        self.titleLabel = SKLabelNode(text: "Pay attention to the notes!")
        self.titleLabel.fontSize = 30
        self.titleLabel.fontColor = .white
        self.titleLabel.fontName = "Futura-Bold"
        self.titleLabel.verticalAlignmentMode = .center
        self.titleLabel.horizontalAlignmentMode = .center
        self.titleLabel.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        self.addChild(self.titleLabel)
    }
    
    
    func labelFadedAnmation() {
        let animateList = SKAction.sequence([SKAction.fadeIn(withDuration: 1.0), SKAction.wait(forDuration: 1.0), SKAction.fadeOut(withDuration: 1.0)])
        self.titleLabel.run(animateList)
    }
    
}
