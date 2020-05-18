//
//  ACTManager.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 13/05/20.
//

import SpriteKit
import PlaygroundSupport

public enum SongName: String, CustomStringConvertible, Codable {

    public var description: String {
        return self.rawValue.capitalized
    }
    
    case C = "do.mp3", D = "re.mp3",
    E = "mi.mp3" ,F = "fa.mp3", G = "sol.mp3",
    A = "la.mp3", B = "si.mp3", beethoven = "ode-to-joy.mov", wrong = "wrong.mp3", correct = "correct.mp3"
}

public class ACTManager {
    
    private init() {}
    
    static let shared = ACTManager()
    
    public func run(_ filename: SongName, onNode: SKNode) {
        
        let effectAudioAction = SKAction.playSoundFileNamed(filename.rawValue, waitForCompletion: false)
        let changeVolumeAction = SKAction.changeVolume(to: 0.001, duration: 0.1)
        let effectAudioGroup = SKAction.group([effectAudioAction, changeVolumeAction])
        onNode.run(effectAudioGroup)
        //        onNode.run(SKAction.playSoundFileNamed(filename.rawValue, waitForCompletion: false))
    }
    
    
     
    public func runner(_ filename: SongName, onNode: SKNode) {
        
        let effectAudioAction = SKAction.playSoundFileNamed(filename.rawValue, waitForCompletion: false)
        let changeVolumeAction = SKAction.changeVolume(to: 0.001, duration: 0.1)
        let effectAudioGroup = SKAction.group([effectAudioAction, changeVolumeAction])
        onNode.run(effectAudioGroup, completion: {
            PlaygroundPage.current.assessmentStatus = .pass(message: "Good! Now try to get the best scores!")
        })
        //        onNode.run(SKAction.playSoundFileNamed(filename.rawValue, waitForCompletion: false))
    }
    
    public func run(filename: SongName, onNode: SKNode, volume: SKAction) {
        
    }
}
