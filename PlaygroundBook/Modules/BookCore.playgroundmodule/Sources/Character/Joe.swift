//
//  Joe.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 13/05/20.
//

import Foundation
import SpriteKit

enum TextureAtlasCategory {
    case Attack, Run
}

enum CustomSize: Int {
    case pianoHeight = 300
    case pianoWidth = 500
}

enum Key: String {
    case Attack, Run, Jump, TrainingPiano, TrainingGuitar
}

class Joe: SKSpriteNode {
    
    var velocity: Double = 0.4
    var myTexture: SKTexture? = SKTexture(imageNamed: "joe")
    
    var trainingFrame = [SKTexture]()
    var guitarFrame = [SKTexture]()
    var charSize = CGSize(width: 300, height: 500.0)
    var runAnimate = SKAction()
    var runMove = SKAction()
    var attackAction = SKAction()
       
    var jumpMove = SKAction()
    
    init() {
        super.init(texture: myTexture, color: .clear, size: charSize)
        
        let textureAtlasTraining = SKTextureAtlas(named: "PlayingPiano")

        for index in 1..<textureAtlasTraining.textureNames.count {
            let textureName = "piano" + String(index)
            trainingFrame.append(textureAtlasTraining.textureNamed(textureName))

        }

        let textureAtlasGuitar = SKTextureAtlas(named: "PlayingGuitar")

        for index in 1..<textureAtlasGuitar.textureNames.count {
            let textureName = "guitar" + String(index)
            guitarFrame.append(textureAtlasGuitar.textureNamed(textureName))

        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func trainingAnimate() {
        
        self.size = CGSize(width: 400, height: 300.0)
        
        let training = SKAction.animate(with: trainingFrame, timePerFrame: 0.1)
        
        let trainingActions = [SKAction.repeatForever(training)]
        
        let runGroupAnimate = SKAction.group(trainingActions)
        
        self.run(runGroupAnimate, withKey: Key.TrainingPiano.rawValue)
        
    }
    
    func trainingGuitar() {
        
        self.size = CGSize(width: 200, height: 400.0)
        
        let training = SKAction.animate(with: guitarFrame, timePerFrame: 0.1)
        
        let trainingActions = [SKAction.repeatForever(training)]
        
        let runGroupAnimate = SKAction.group(trainingActions)
        
        self.run(runGroupAnimate, withKey: Key.TrainingGuitar.rawValue)
    }
    
    
    
    func idlePosition() {
        
        self.size = CGSize(width: 200, height: 400.0)
        
        let idleTexture = SKTexture(imageNamed: "joe")
        
        self.run(SKAction.setTexture(idleTexture))
        
    }
    
    func listeningPosition() {
        
        self.size = CGSize(width: 200, height: 400.0)
        
        let idleTexture = SKTexture(imageNamed: "joe_listening")
        
        self.run(SKAction.setTexture(idleTexture))
    }
    
    func hiPosition() {
        
        self.size = CGSize(width: 200, height: 400.0)
               
        let idleTexture = SKTexture(imageNamed: "joe_hi")
               
        self.run(SKAction.setTexture(idleTexture))
        
    }
    
    func stopedPostion() {
        
//        self.size = CGSize(width: 200, height: 400.0)
               
        let idleTexture = SKTexture(imageNamed: "joe_stoped")
               
        self.run(SKAction.setTexture(idleTexture))
        
    }

//    func createRunAnimate() {
//        runAnimate = SKAction.animate(with: trainingFrame, timePerFrame: 0.1)
//        runMove = SKAction.move(to: changePosition(sprite: self), duration: velocity)
//
//        let runActions = [SKAction.repeatForever(runAnimate), SKAction.repeatForever(runMove)]
//        let runGroupAnimate = SKAction.group(runActions)
//
//        self.run(runGroupAnimate, withKey: Key.Run.rawValue)
//    }
//
//    func attack() {
//        attackAction = SKAction.animate(with: attackFrame, timePerFrame: 0.1)
//        self.run(SKAction.repeatForever(attackAction), withKey: "Attack")
//    }
//
//    func runMoveFunction() {
//        runMove = SKAction.move(to: changePosition(sprite: self), duration: velocity)
//        self.run(runMove)
//    }
//
//    func changePosition(sprite: SKSpriteNode) -> CGPoint {
//        let newPosition = CGPoint(x: sprite.position.x + sprite.size.height, y: sprite.position.y)
//        return newPosition
//    }
//
//    func jump() {
//        // let newPosition = CGPoint(x: self.position.x*1.1, y: self.position.y * 1.2)
//    }

}
