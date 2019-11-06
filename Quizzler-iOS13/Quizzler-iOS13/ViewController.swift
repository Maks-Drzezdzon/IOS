//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let questions = ["1+2=3", "2+2=4", "2+2=22"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        questionText.text = questions.randomElement()
        
    }
    
}

