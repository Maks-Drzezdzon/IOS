//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
        let bmi = weight / (height * 2)
        print(bmi)
        
    }

}

