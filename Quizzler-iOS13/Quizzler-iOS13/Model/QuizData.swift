//
//  QuizData.swift
//  Quizzler-iOS13
//
//  Created by Maks Drzezdzon on 09/11/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct QuizData {
    let quiz = [
        Question(q:"1+2=3", a:"True"),
        Question(q:"2+2=4", a:"True"),
        Question(q:"2+2=22", a:"False")
    ]
    var questionNumber = 0
    
    func checkAnswer(_ userAnswer: String) -> Bool{
        
        if userAnswer == quiz[questionNumber].answer {
            return true
        }else{
            return false
        }
        
    }
}
