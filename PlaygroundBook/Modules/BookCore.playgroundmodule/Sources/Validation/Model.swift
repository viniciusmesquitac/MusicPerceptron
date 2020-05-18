//
//  Model.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 17/05/20.
//

import Foundation

struct Model: Codable {
    
    var training: Int
    var numberSongs: Int
    var score: Int

    
    public init(training: Int, numberSongs: Int, score: Int) {
        
        self.training = training
        self.numberSongs = numberSongs
        self.score = score
        
    }
    
    
    func verifyResults() {
        
        
    }
}

