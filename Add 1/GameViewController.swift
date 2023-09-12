//
//  ViewController.swift
//  Add 1
//
//  Created by Emilija Marija on 11.09.23.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var numberLabel: UILabel?
    @IBOutlet weak var inputField: UITextField?
    
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateScoreLabel()
        updateNumberLabel()
    }
    
    func updateScoreLabel() {
        scoreLabel?.text = String(score)
    }

    func updateNumberLabel() {
        numberLabel?.text = String.randomNumber(lenght: 4)
    }
    
    @IBAction func inputFieldDidChange() {
        guard let numberText = numberLabel?.text, let inputText = inputField?.text else {
            return
        }
        
        guard inputText.count == 4 else {
            return
        }
        
        var isCorrect = true
        for n in 0..<4 {
            let input = inputText.integer(at: n)
            let number = numberText.integer(at: n)
            
            if input != number + 1 {
                isCorrect = false
                break
            }
        }
        
        if isCorrect {
            score += 1
        } else {
            score -= 1
        }
        
        updateNumberLabel()
        updateScoreLabel()
        inputField?.text = ""
    }
}

