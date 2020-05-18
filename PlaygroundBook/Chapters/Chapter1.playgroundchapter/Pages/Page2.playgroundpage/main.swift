//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
import PlaygroundSupport
import SpriteKit
import BookCore

public typealias Velocity = Float

func addSongToDatabase(_ songs: [Song]) {
    
    let coder = JSONEncoder()
    
    do {
        
        let data = try coder.encode(songs)
        
        if let liveView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy {
            
            liveView.send(.data(data))
            
        }
        
    } catch {
        
    }
    
}
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, Song)
//#-end-hidden-code
/*:
 In the collect data step you should help your model to know which music notes exist, it is also important to say that the instruments reproduce unique sounds, so make sure that your model knows all the notes of most instruments!

 * Experiment:
 
    update your [`dataset`](glossary://Dataset) to joe understand more about music, try to choose the corrent note in the process
 
    this will get better scores, if you chose an wrong note, you will createn an [`outlier`](glossary://Outlier), they are bad for your Machine Learning
 */

addSongToDatabase([
    //#-editable-code
    Song(from: .beethoven, instrument: .piano),
    //#-end-editable-code
])


/*:
 
[Next Page: Training](@next)

*/


