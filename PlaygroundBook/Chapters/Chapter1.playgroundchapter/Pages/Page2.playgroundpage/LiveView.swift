//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import UIKit
import BookCore
import PlaygroundSupport

// Instantiate a new instance of the live view from BookCore and pass it to PlaygroundSupport.

let gameScene = instantiateLiveView(with: "GameScene")
gameScene.preferredContentSize = CGSize(width: 600, height: 800)


PlaygroundPage.current.liveView = gameScene

PlaygroundPage.current.assessmentStatus = .fail(hints: ["Run the code to add dataset", "Try to get the best score!"], solution: "Add more songs to the dataset! -> Song(from: .chopin, instrument: .piano)")
