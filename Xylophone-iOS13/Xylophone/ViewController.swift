//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //audio visual foundation mud
import Darwin

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        // ! tells that button will not be nil
        playSound(noteKey: sender.currentTitle!)
        sleep(1)
    }
    
    func playSound(noteKey:String) {
        let url = Bundle.main.url(forResource: "\(noteKey)", withExtension: "wav")
            //use option and click on method for apple doc
            player = try! AVAudioPlayer(contentsOf: url!)
            guard let player = player else { return }
            player.play()
    }
}

