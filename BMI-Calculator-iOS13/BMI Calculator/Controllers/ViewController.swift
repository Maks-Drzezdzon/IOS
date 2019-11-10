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
    
    @IBAction func hSlider(_ sender: UISlider) {
        hLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func wSlider(_ sender: UISlider) {
        wLabel.text = String(format: "%.0f", sender.value)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

