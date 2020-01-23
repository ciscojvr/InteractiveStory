//
//  PageController.swift
//  InteractiveStory
//
//  Created by Francisco Ozuna-Diaz on 1/16/20.
//  Copyright © 2020 Francisco Ozuna. All rights reserved.
//

import UIKit

class PageController: UIViewController {
    
    var page: Page?
    
    // MARK: – User Interface Properties
    
    let artworkView = UIImageView()
    let storyLabel = UILabel()
    let firstChoiceButton = UIButton(type: .system)
    let secondChoiceButton = UIButton(type: .system)
    
    
    required init?(coder aDecoder: NSCoder) { // this is a designated initializer required for every subclass of UIViewController
        super.init(coder: aDecoder)
    }
    
    init(page: Page) { // our custom initializer so we can create our instances
        self.page = page
        super.init(nibName: nil, bundle: nil) // since we're treating our init method here as our subclasses designated initializer we need to call this desginated initializer on UIViewController to initialize up the chain
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view.backgroundColor = .blue
        
        if let page = page {
            // print(page.story.text)
            artworkView.image = page.story.artwork
            
            let attributedString = NSMutableAttributedString(string: page.story.text)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 10
            
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
            
            storyLabel.attributedText = attributedString
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.addSubview(artworkView)
        artworkView.translatesAutoresizingMaskIntoConstraints = false
        // turns off automatic application of constraints so that you can set them explicitly. Interface Builder typically handles this for you but we are creating views programmatically
    
        NSLayoutConstraint.activate([
            artworkView.topAnchor.constraint(equalTo: view.topAnchor),
            artworkView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            artworkView.rightAnchor.constraint(equalTo: view.rightAnchor),
            artworkView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        
        view.addSubview(storyLabel)
        storyLabel.numberOfLines = 0 // this allows the system to determine how many lines it needs to display to show all the text.
        storyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            storyLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -48.0)
        ])
    }

}
