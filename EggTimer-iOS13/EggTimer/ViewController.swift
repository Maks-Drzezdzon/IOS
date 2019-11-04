//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft":10, "Hard":720, "Medium":420]
    
    var timer = Timer()
    var totalTime = 0
    var secPassed = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        // resets/creates timer when called/pressed
        let hardness = sender.currentTitle!
        // ! removes safety check
        totalTime = eggTimes[hardness]!
        
        //reset data
        progressBar.progress = 0.0
        secPassed = 0
        titleLabel.text = hardness
        
        Timer.scheduledTimer(timeInterval: 1.0,target: self,selector:#selector(updateTimer),userInfo:nil, repeats: true)
    }
    // selector comes from obj c
    @objc func updateTimer(){
        if secPassed < totalTime{
            secPassed += 1
            let progress = Float(secPassed) / Float(totalTime)
            progressBar.progress = progress
            if progressBar.progress == 1{
                playSound()
            }
        }else{
            timer.invalidate()
            titleLabel.text = "Done"
        }
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
