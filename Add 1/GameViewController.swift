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
    @IBOutlet weak var backgroundImage: UIImageView?
    
    var score = 0
    var timer: Timer?
    var gameLenght = 60
    lazy var seconds = gameLenght
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateScoreLabel()
        updateNumberLabel()
        updateTimeLabel()
    }
    
    func updateScoreLabel() {
        scoreLabel?.text = String(score)
    }

    func updateNumberLabel() {
        numberLabel?.text = String.randomNumber(lenght: 4)
    }
    
    func updateTimeLabel() {
        let min = (seconds/60) % 60
        let sec = seconds % 60
        
        timeLabel?.text = String(format: "%02d", min) + ":" + String(format: "%02d", sec)
    }
    
    func flashBackground(name: String) {
        let delay = 0.4
        backgroundImage?.image = UIImage(named: name)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.backgroundImage?.image = UIImage(named: "bg")
        }
    }
    
    func finishGame() {
        timer?.invalidate()
        timer = nil
        
        let alert = UIAlertController(title: "Time's Up!", message: "You got a score of \(score) points!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Start new game", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        score = 0
        seconds = gameLenght
        
        updateScoreLabel()
        updateNumberLabel()
        updateTimeLabel()
        backgroundImage?.image = UIImage(named: "bg")
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
            flashBackground(name: "correctbg")
        } else {
            score -= 1
            flashBackground(name: "wrongbg")
        }
        
        updateNumberLabel()
        updateScoreLabel()
        inputField?.text = ""
        
        if timer == nil {
            self.seconds = self.gameLenght
            
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if self.seconds == 0 {
                    self.finishGame()
                } else if self.seconds <= self.gameLenght {
                    self.seconds -= 1
                    self.updateTimeLabel()
                }
            }
        }
    }
}

