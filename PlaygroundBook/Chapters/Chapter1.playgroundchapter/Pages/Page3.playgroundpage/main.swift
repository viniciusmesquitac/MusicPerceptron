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


typealias Number = Int

func startTraining(with instrument: Instrument, until iterations: Int) {
    
    let coder = JSONEncoder()
    
    let interaction = Interaction(instrument: instrument, iterations: iterations)
    
    do {
        
        let data = try coder.encode(interaction)
        
        if let liveView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy {
            
            liveView.send(.data(data))
            
            PlaygroundPage.current.assessmentStatus = .pass(message: "Good! You are training the model based on your dataset!")
            
        }
        
    } catch {
        
    }
    
}
//#-end-hidden-code
/*:

 Now your model will need a lot of training, select a number of interactions and wait for it to converge to
  
  an acceptable result, remember that the greater the number of iterations, the better your model will be!
 
 
 */


let numberIterations: Number = /*#-editable-code Do your choice*/5/*#-end-editable-code*/

let instrument: Instrument = /*#-editable-code Do your choice*/.guitar/*#-end-editable-code*/

startTraining(with: instrument, until: numberIterations)


/*:
 
[Next Page: See the results!](@next)

*/


