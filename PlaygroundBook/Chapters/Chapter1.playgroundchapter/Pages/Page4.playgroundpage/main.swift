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


func testMyData(dataset: String, model: String) {
    
//
    var numberOutliers: Int? = nil

    if let liveView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy {
        
        liveView.send(.boolean(true))
        
        PlaygroundPage.current.assessmentStatus = .pass(message: "You've completed all the steps, let's see how well it turned out")

        
    }
    
}


func musicsDataset() -> String {
    return "dataset"
    
}

func getTrainigModel() -> String {
    return "model"
    
}

//#-end-hidden-code
/*:
 At this stage, your model is already trained! let's see how it goes?
  
 The end result will always depend on your data collection and training, if it doesn't have a good result,
  
 go back and evaluate the steps!
  
 Run the code below to evaluate the results!
*/

let myDataset = musicsDataset()

let myTrainingModel = getTrainigModel()

testMyData(dataset: myDataset, model: myTrainingModel)





