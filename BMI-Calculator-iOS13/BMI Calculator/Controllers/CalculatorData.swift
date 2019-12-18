//
//  CalculatorData.swift
//  BMI Calculator
//
//  Created by Maks Drzezdzon on 10/11/2019.
//

import UIKit

struct CalculatorData {
    var bmi: BMI?
    
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "you are underweight", color: #colorLiteral(red: 0, green: 0.6626870036, blue: 0.9884054065, alpha: 1))
        }else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "you are healthy", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "you are overweight", color: #colorLiteral(red: 0.6624035239, green: 0, blue: 0.08404419571, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        // set default 
        let bmiFormated = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiFormated
       
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
