//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let softTime = 5
    let medTime = 7
    let hardTime = 12
    let eggTimes = ["Soft":5, "Hard":12, "Medium":7]

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        print(eggTimes[hardness])
        
        switch hardness {
        case "Soft":
            print(softTime)
        case "Medium":
            print(medTime)
        case "Hard":
            print(hardTime)
        default:
            print("Error")
        }
    }
    
}
