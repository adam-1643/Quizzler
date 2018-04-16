//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()

    }
    
    
    func updateUI() {
      
        scoreLabel.text = "Punkty: \(score)"
        
        progressLabel.text = "\(questionNumber+1)/\(allQuestions.list.count)"
        
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber+1)
        
    }
    

    func nextQuestion() {
        
        if questionNumber < allQuestions.list.count  {
            
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
            
        } else {
            
            var message : String = ""
            if score == 8 { message = "Wspaniale!" }
            else if score > 5 { message = "Całkiem nieźle!" }
            else if score > 3 { message = "Mogło być lepiej..."}
            else if score > 0 { message = "Tragedia!" }
            else { message = "Dno i wodorosty!" }
            
            let alert = UIAlertController(title: "Koniec pytań", message: "Twój wynik to: \(score). \(message)", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
            { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
    
        if pickedAnswer == allQuestions.list[questionNumber].answer {
            score += 1
            ProgressHUD.showSuccess("Dobrze!")
        } else {
            ProgressHUD.showError("Źle!")
        }
        
    }
    
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        nextQuestion()
       
    }
    

    
}
