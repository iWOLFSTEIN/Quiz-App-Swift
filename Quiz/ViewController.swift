//
//  ViewController.swift
//  Quiz
//
//  Created by BrainX Technologies on 12/04/2023.
//

import UIKit

struct Question{
    var questionStatement: String
    var option1: String
    var option2: String
    var option3: String
    var option4: String
}


var questionsList: [Question] = [
Question(questionStatement: "What is 7+6", option1: "10", option2: "5", option3: "13", option4: "16"),
Question(questionStatement: "What is capital of Pakistan", option1: "Multan", option2: "Lahore", option3: "Karachi", option4: "Islamabad"),
Question(questionStatement: "Who created Pakistan", option1: "Jinnah", option2: "Modi", option3: "Imran Khan", option4: "None of Above"),
Question(questionStatement: "Which is a programming language", option1: "English", option2: "Python", option3: "Urdu", option4: "Japanese"),
Question(questionStatement: "Which is not a part of computer", option1: "Mouse", option2: "Keyboard", option3: "Smartphone", option4: "Monitor")

]
var answersList: [String] = ["13", "Islamabad", "Jinnah", "Python", "Smartphone"]

var currentQuestion: Int = 0

var correctAnswersCount: Int = 0


class ViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var questionAnswerView: UIView!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var option1: UILabel!
    
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var option4: UILabel!
    @IBOutlet weak var option3: UILabel!
    @IBOutlet weak var option2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionAnswerView.layer.cornerRadius = 10
        checkButton.layer.cornerRadius = 10
        nextButton.layer.cornerRadius = 10
        
        
        resultLabel.isHidden = true
        resultText.isHidden = true
        
        
        answerField.delegate = self
                
        
        loadQuestion(number: currentQuestion)
        
        
        
    }

    @IBAction func checkAnswer(_ sender: UIButton) {
      
        if let answer = answerField.text {
            if !answerField.text!.isEmpty {
                if answer == answersList[currentQuestion] {
                    checkButton.backgroundColor = .green
                    correctAnswersCount += 1
                }
                else {
                    checkButton.backgroundColor = .red
                }
                answerField.isEnabled = false
                correctAnswer.text = answersList[currentQuestion]
                if currentQuestion == 4 {
                    nextButton.setTitle("Answers", for: UIControl.State.normal)
                    
                }
            }
        }
        
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        if !correctAnswer.text!.isEmpty{
            if currentQuestion < 4 {
                currentQuestion += 1
                resetChanges()
                loadQuestion(number: currentQuestion)
            }
            else if currentQuestion == 4 {
                currentQuestion = 0
                resetChanges()
                loadQuestion(number: currentQuestion)
                resultText.text = "\(correctAnswersCount) out of \(questionsList.count)"
                resultText.isHidden = false
                resultLabel.isHidden = false
                
            }
        }
        
    }
    
    func loadQuestion(number index: Int) {
        question.text = questionsList[index].questionStatement
        option1.text = questionsList[index].option1
        option2.text = questionsList[index].option2
        option3.text = questionsList[index].option3
        option4.text = questionsList[index].option4
    }
    
    func resetChanges(){
        nextButton.setTitle("Next", for: UIControl.State.normal)
        answerField.isEnabled = true
        correctAnswer.text = ""
        answerField.text = ""
        checkButton.backgroundColor = UIColor(red: 254/255, green: 255/255, blue: 134/255, alpha: 1.0)
        resultLabel.isHidden = true
        resultText.isHidden = true
    }
}

extension ViewController: UITextFieldDelegate{
    
}
