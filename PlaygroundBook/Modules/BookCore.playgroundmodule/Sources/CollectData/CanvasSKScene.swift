//
//  CanvasSKScene.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 13/05/20.
//

import SpriteKit
import UIKit

public class CanvasSKScene: SKScene {
    
    var titleLabel = SKLabelNode()
    var shapeButton = SKShapeNode()
    
    var conversation = SKSpriteNode()
    
    static let sharedNode = SKNode()
    
    static let joeCanvas = Joe()
    
    override public func didMove(to view: SKView) {
//        loadBackground()
        addChild(CanvasSKScene.sharedNode)
        loadTextLabel()
        labelFadedAnimation()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
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
        
        let startPointX = frame.width/2
        let startPointY = frame.height/2
        
        player.size = CGSize(width: 100, height: 200)
        player.zPosition = 1
        player.name = "Joe"
        player.position = CGPoint(x: startPointX, y: startPointY)
        self.addChild(player)
    }
    
    func loadBackground() {
          
        let backgroundTexture = SKTexture(imageNamed: "background_room")
        let background = SKSpriteNode(texture: backgroundTexture)
        background.size = CGSize(width: 800, height: 600)
        background.zPosition = -10
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        addChild(background)
    
    }
    
    func loadTextLabel() {
        
        self.titleLabel = SKLabelNode(text: "Pay attention to the notes!")
        self.titleLabel.fontSize = 15
        self.titleLabel.fontColor = .black
        self.titleLabel.fontName = "Futura-Bold"
        self.titleLabel.verticalAlignmentMode = .center
        self.titleLabel.horizontalAlignmentMode = .center
        self.titleLabel.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        self.addChild(self.titleLabel)
    }
    
    
    func loadConversation() {
        
        let startPointX = frame.width/2 - 100
        let startPointY = frame.height/2 + 100
        
        conversation.size = CGSize(width: 100, height: 100)
        conversation.texture = SKTexture(imageNamed: "balao")
        conversation.zPosition = 1
        conversation.position = CGPoint(x: startPointX, y: startPointY)
        self.addChild(conversation)
        
        createLabel(text: "Hi i am Joe!", inside: conversation)
        
        let waitToRemove = SKAction.wait(forDuration: 5)
        self.run(waitToRemove, completion: {
            
            self.conversation.removeFromParent()
            
        })
    
        
    }
    
    func createLabel(text: String, inside: SKNode) {
        let label = SKLabelNode(text: text)
        label.fontSize = 10
        label.numberOfLines = 2
        label.fontColor = .white
        label.zPosition = 2
        label.fontName = "Futura-Bold"
        label.verticalAlignmentMode = .center
        label.horizontalAlignmentMode = .center
        label.position = CGPoint(x: inside.frame.width/2 - 50, y: inside.frame.height/2 - 50)
        inside.addChild(label)
    }
    
    
    func labelFadedAnimation() {
        let animateList = SKAction.sequence([SKAction.fadeIn(withDuration: 1.0), SKAction.wait(forDuration: 1.0), SKAction.fadeOut(withDuration: 1.0)])
        
        self.titleLabel.run(animateList) {
            
            CanvasSKScene.joeCanvas.hiPosition()
            
            self.loadCharacter(CanvasSKScene.joeCanvas)
            
            self.loadConversation()
        }
        
    }
}
