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
    var questionNumber = 0
    let questions = [
        ["1+2=3", "true"],
        ["2+2=4", "true"],
        ["2+2=22", "true"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = questions[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("filler pass")
        }else{
            print("filler fail")
        }
        
        if questionNumber + 1 < questions.count {
            questionNumber += 1
        }else{
            questionNumber = 0
        }
        updateUI()
    }
    func updateUI(){
        questionText.text = questions[questionNumber][0]
    }
    
}

