//
//  CalculatorData.swift
//  BMI Calculator
//
//  Created by Maks Drzezdzon on 10/11/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorData {
    var bmi: BMI?
    
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * 2)
        bmi = BMI(value: bmiValue, advice: <#T##String#>, color: <#T##UIColor#>)
        
    }
    
    func getBMIValue() -> String {
        // set default 
        let bmiFormated = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiFormated
       
    }
}
