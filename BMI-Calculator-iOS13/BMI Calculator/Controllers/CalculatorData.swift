//
//  CalculatorData.swift
//  BMI Calculator
//
//  Created by Maks Drzezdzon on 10/11/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorData {
    var bmi: Float = 0.0
    
    
    mutating func calculateBMI(height: Float, weight: Float) {
        bmi = weight / (height * 2)
        
    }
    
    func getBMIValue() -> String{
        let bmiFormated = String(format: "%.1f", bmi)
        return bmiFormated
    }
}
