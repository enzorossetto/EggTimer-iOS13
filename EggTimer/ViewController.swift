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
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var timer: Timer?
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        if let hardness = sender.currentTitle, let totalTime = eggTimes[hardness] {
            if timer == nil || !timer!.isValid {
                secondsPassed = 0
                titleLabel.text = hardness
                progressBar.progress = 0.0
                
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    self.updateTimer(timer: timer, totalTime: totalTime)
                }
            }
        } else {
            print("Error")
        }
    }
    
    func updateTimer(timer: Timer, totalTime: Int) {
        print("\(self.secondsPassed) seconds passed")
        
        progressBar.progress = Float(self.secondsPassed) / Float(totalTime)
        
        if secondsPassed == totalTime {
            titleLabel.text = "Done!"
            playSound()
            timer.invalidate()
        } else {
            secondsPassed += 1
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
