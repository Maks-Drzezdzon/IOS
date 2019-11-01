//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDiceView: UIImageView!
    @IBOutlet weak var rightDiceView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // who.what = value
        leftDiceView.image = #imageLiteral(resourceName: "DiceSix")
        rightDiceView.image = #imageLiteral(resourceName: "DiceTwo")

    }


}

