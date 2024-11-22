//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Mitali Ahir on 2024-11-20.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var questionlabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var questionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updatedUI()// Set visibility of views and update views
        
    }
    func updatedUI(){
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        //Updating navigation item title to particular index of question
        navigationItem.title = "Question \(questionIndex + 1)"
        
        //Using questionIndex property to access particular question
        let currentQuestion = questions[questionIndex]
        questionlabel.text = currentQuestion.text
        
        let progressValue = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(progressValue, animated: true)
        
        let currentAnswers = currentQuestion.answers
        
        //Showing input view depending on question type
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultiStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
      
        
    }//updateUI() ends
    
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
        //singleButton1.setTitle(currentQuestion.answers[0].text, for: .normal)
    }
    
    func updateMultiStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }

    func updateRangedStack(using answers: [Answer]){
        rangedStackView.isHidden = false
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
        
    }
}
