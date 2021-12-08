//
//  ViewController.swift
//  AutoLayout
//
//  Created by ihlas on 8.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    var quizBrain = QuizBrain()


    
    override func viewDidLoad() {
    super.viewDidLoad()
        updateUI()

}
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGoItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGoItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        
            
        }
        
        
        quizBrain.nextQuestion()
        
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
         
        }

   @objc func updateUI(){
       questionLabel.text = quizBrain.getQuestionText()
       progressBar.progress  = quizBrain.getProgress()
       scoreLabel.text = "Score:\(quizBrain.getScore())"
       
       trueButton.backgroundColor = UIColor.clear
       falseButton.backgroundColor = UIColor.clear
   
        
    }
}

