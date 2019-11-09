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
    var score = 0
    
    mutating func getScore() -> Int{
        return score
    }
    
    func getQuestionText() -> String{
        return quiz[questionNumber].text
    }
    
    func  getProgress() -> Float {
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress
    }
    
    mutating func nextQuestion(){
        // mutating lets the variable change and update
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }else{
            questionNumber = 0
            score = 0
        }
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        }else{
            return false
        }
        
    }
}
