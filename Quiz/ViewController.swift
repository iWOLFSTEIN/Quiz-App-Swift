//
//  ViewController.swift
//  Quiz
//
//  Created by BrainX Technologies on 12/04/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var questionAnswerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionAnswerView.layer.cornerRadius = 10
        checkButton.layer.cornerRadius = 10
        nextButton.layer.cornerRadius = 10
    }

    @IBAction func checkAnswer(_ sender: UIButton) {
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
    }
}

