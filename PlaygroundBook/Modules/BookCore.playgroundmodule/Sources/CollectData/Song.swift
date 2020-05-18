//
//  Song.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 14/05/20.
//

import Foundation

public enum Instrument: String, CustomStringConvertible, Codable {
    
    public var description: String {
        return self.rawValue
    }
    
    case guitar
    case keyboard
    case flute
    case violin
    case piano
}

public enum Compositor: String, CustomStringConvertible, Codable {
    
    public var description: String {
        return self.rawValue.capitalized
    }
    case beethoven
    case chopin
}


public struct Song: Codable {
    
    var name: SongName
    var instrument: Instrument
    
    public init(from name: SongName, instrument: Instrument) {
        self.name = name
        self.instrument = instrument
    }
    
}

