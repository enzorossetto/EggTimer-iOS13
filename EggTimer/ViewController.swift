//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var timer: Timer?
    var secondsPassed = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        if let hardness = sender.currentTitle, let totalTime = eggTimes[hardness] {
            if timer == nil || !timer!.isValid {
                secondsPassed = 0
                titleLabel.text = hardness
                progressBar.progress = 0.0
                
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                    print("\(self.secondsPassed) seconds passed")
                    
                    self.progressBar.progress = Float(self.secondsPassed) / Float(totalTime)
                    
                    if self.secondsPassed == totalTime {
                        self.titleLabel.text = "Done!"
                        timer.invalidate()
                    } else {
                        self.secondsPassed += 1
                    }
                }
            }
        } else {
            print("Error")
        }
    }
    
}
