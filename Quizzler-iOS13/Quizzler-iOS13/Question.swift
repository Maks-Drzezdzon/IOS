//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Maks Drzezdzon on 06/11/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text:String
    let answer:String
    
    init(q:String, a:String) {
        self.text = q
        self.answer = a
    }
}
