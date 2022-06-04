//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    lazy var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let userAnswer = sender.title(for: .normal)!
        
        storyBrain.nextStory(userChoice: userAnswer)
        
        updateView()
    }
    
    func updateView() {
        storyLabel.text = storyBrain.getTitleText()
        
        let choices = storyBrain.getChoicesText()
        if choices[0] == "0" {
            choice1Button.isHidden = true
        } else {
            choice1Button.isHidden = false
            choice1Button.setTitle(choices[0], for: .normal)
        }
        choice2Button.setTitle(choices[1], for: .normal)
    }
}

