//
//  Note.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 14/05/20.
//

import Foundation

class Note {
    
    var letter: String
    
    init(withLetter description: String) {
        self.letter = description
    }
    
    
    static func fromJson() -> [Note] {
         
         var jsonResult = [String]()
         var notes = [Note]()
         
         if let path = Bundle.main.path(forResource: "Notes", ofType: "json") {
             do {
                 let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                 let result = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [String]
                 jsonResult = result
             } catch {
                 NSLog(error.localizedDescription)
             }
         }
         
        for result in jsonResult {
            let note = Note(withLetter: result)
            notes.append(note)
         }
         
         return notes
         
     }
    
    
    static func fromBethooven() -> [Note] {
        
        var jsonResult = [String]()
        var notes = [Note]()
        
        if let path = Bundle.main.path(forResource: "Notes", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let result = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [String]
                jsonResult = result
            } catch {
                NSLog(error.localizedDescription)
            }
        }
        
        for result in jsonResult {
            let note = Note(withLetter: result)
            notes.append(note)
        }
        
        return notes
    }
    
}
