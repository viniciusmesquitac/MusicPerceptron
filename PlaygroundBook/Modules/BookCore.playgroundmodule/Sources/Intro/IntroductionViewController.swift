//
//  IntroductionViewController.swift
//  BookCore
//
//  Created by Vinicius Mesquita on 17/05/20.
//

import Foundation
import UIKit

public class IntroductionViewController: UIViewController {
    
    var imageName: String
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        self.view = view
        
        view.backgroundColor = UIColor.darkGray
        
//        let backgroundView = UIImageView(image: UIImage(named: ""))
//        view.addSubview(backgroundView)
//
//        backgroundView.translatesAutoresizingMaskIntoConstraints = false
//
//        backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true

        let imageView = UIImageView(image: UIImage(named: imageName))

        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    public init(withImageName imageName: String) {
        self.imageName = imageName
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
