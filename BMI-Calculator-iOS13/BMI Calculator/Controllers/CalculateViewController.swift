//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calcData = CalculatorData()
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var wLabel: UILabel!
    @IBOutlet weak var hSlider: UISlider!
    @IBOutlet weak var wSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func hSlider(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        hLabel.text = "\(height)m"
    }
    
    @IBAction func wSlider(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        wLabel.text = "\(weight)"
    }
    
    @IBAction func calcButton(_ sender: UIButton) {
        let height = hSlider.value
        let weight = wSlider.value
        
        calcData.calculateBMI(height: height, weight:weight)
        // prettymuch intents in ios
        // withIdentifier is the label added to segue, self because its being passed to this controller
        self.performSegue(withIdentifier: "goToResultsController", sender: self)
        
        /*
         // code for secondViewController
         let secondViewCtrl = SecondViewController()
        secondViewCtrl.bmiValue = String(format: "%.1f", bmi)
        self.present(secondViewCtrl, animated: true, completion: nil)*/
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultsController" {
            // pass data to as! with downcasting
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calcData.getBMIValue()
        }
    }

}

