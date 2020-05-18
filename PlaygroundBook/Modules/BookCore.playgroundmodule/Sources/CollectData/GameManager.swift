//
//  ButtonsFactory.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 14/05/20.
//

import UIKit


public class GameManager {
    
    
    var notes: [Note] = []
    var songs: [Song] = []
    
    var userNotes: [Note] = []
    
    var score: Int = 0
    var outlier: Int = 0
    
    var noteButtons: [UIButton] = []
    
    var timeNotes: Double {
        get { return 1.1 }
    }
    
    var currentNote: Note?
    var currentIndex: Int = 0
    
    var delegate: GameManagerDelegate?
    
    public init() {
        notes = Note.fromJson()
    }
    
    // button Actions notes [ 1 .. 7]
    @objc func btnAction1() {
        ACTManager.shared.run(.C, onNode: CanvasSKScene.sharedNode)
        let note = Note(withLetter: "C")
        verifyNote(note)
    }
    @objc func btnAction2() {
        ACTManager.shared.run(.D, onNode: CanvasSKScene.sharedNode)
        let note = Note(withLetter: "D")
        verifyNote(note)
    }
    @objc func btnAction3() {
        ACTManager.shared.run(.E, onNode: CanvasSKScene.sharedNode)
        let note = Note(withLetter: "E")
        verifyNote(note)
    }
    @objc func btnAction4() {
        ACTManager.shared.run(.F, onNode: CanvasSKScene.sharedNode)
        let note = Note(withLetter: "F")
        verifyNote(note)
    }
    @objc func btnAction5() {
        ACTManager.shared.run(.G, onNode: CanvasSKScene.sharedNode)
        let note = Note(withLetter: "G")
        verifyNote(note)
    }
    @objc func btnAction6() {
        ACTManager.shared.run(.A, onNode: CanvasSKScene.sharedNode)
        let note = Note(withLetter: "A")
        verifyNote(note)
    }
    @objc func btnAction7() {
        ACTManager.shared.run(.B, onNode: CanvasSKScene.sharedNode)
        let note = Note(withLetter: "A")
        verifyNote(note)
    }
    
    func configureButton(button btnNote: UIButton, index: Int) {
        
        switch index {
            
        case 0:
            noteButtons.append(btnNote)
            btnNote.addTarget(self, action: #selector(btnAction1), for: .touchUpInside)
        case 1:
            noteButtons.append(btnNote)
            btnNote.addTarget(self, action: #selector(btnAction2), for: .touchUpInside)
        case 2:
            noteButtons.append(btnNote)
            btnNote.addTarget(self, action: #selector(btnAction3), for: .touchUpInside)
        case 3:
            noteButtons.append(btnNote)
            btnNote.addTarget(self, action: #selector(btnAction4), for: .touchUpInside)
        case 4:
            noteButtons.append(btnNote)
            btnNote.addTarget(self, action: #selector(btnAction5), for: .touchUpInside)
        case 5:
            noteButtons.append(btnNote)
            btnNote.addTarget(self, action: #selector(btnAction6), for: .touchUpInside)
        case 6:
            noteButtons.append(btnNote)
            btnNote.addTarget(self, action: #selector(btnAction7), for: .touchUpInside)
        default:
            btnNote.addTarget(self, action: #selector(btnAction1), for: .touchUpInside)
        }
    }
    
    func verifyNote(_ note: Note) {
        
        if note.letter == currentNote?.letter {
            delegate?.didUpdateSquare(color: .green)
            score += 10
            delegate?.didUpdateScore(score: score)
        } else {
            delegate?.didUpdateSquare(color: .red)
            outlier += 1
            delegate?.didUpdateOutlier(outlier: outlier)
        }
        
        if currentNote == nil {
            delegate?.didUpdateSquare(color: .black)
        }
    }
    
//    func changeButtonColor(_ button: UIButton) {
//        button.backgroundColor =
//    }
//
    
    func updateNote(index currentIndex: Int) {
        
        let currentNote = self.notes[currentIndex]
        
        switch currentNote.letter {
        case "C":
            self.noteButtons[0].backgroundColor = .green
        case "D":
            self.noteButtons[1].backgroundColor = .green
        case "E":
            self.noteButtons[2].backgroundColor = .green
        case "F":
            self.noteButtons[3].backgroundColor = .green
        case "G":
            self.noteButtons[4].backgroundColor = .green
        case "A":
            self.noteButtons[5].backgroundColor = .green
        case "B":
            self.noteButtons[6].backgroundColor = .green
        default:
            self.noteButtons[0].backgroundColor = .clear
        }
        
        
    }
    
    func removeAllButtonColor() {
        noteButtons.forEach { (button) in
            button.backgroundColor = .clear
        }
    }
}

extension GameManager {
    
    public func startSongs(_ songs: [Song]) {
        
        CanvasSKScene.joeCanvas.listeningPosition()
        
        for song in songs {
            ACTManager.shared.runner(song.name, onNode: CanvasSKScene.sharedNode)
            addNote()
        }
        
    }
    
    func addNote() {
        
           DispatchQueue.main.asyncAfter(deadline: .now() + timeNotes) {
            
//            guard self.currentIndex == self.notes.count - 1 else { return }
            
            if self.currentIndex < self.notes.count - 1 {
                self.currentIndex += 1
                self.removeAllButtonColor()
                self.currentNote = self.notes[self.currentIndex]
                self.updateNote(index: self.currentIndex)
                self.addNote()
           }
        }
    }
}

protocol GameManagerDelegate: class {
    
    func didUpdateSquare(color: UIColor)
    
    func didUpdateScore(score: Int)
    
    func didUpdateOutlier(outlier: Int)
}

