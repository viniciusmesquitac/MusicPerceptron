//
//  Interaction.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 15/05/20.
//

import Foundation

public struct Interaction: Codable {
    
    var totalIterations: Int
    var instrument: Instrument
    
    public init(instrument: Instrument, iterations: Int) {
        self.totalIterations = iterations
        self.instrument = instrument
    }
    
}
