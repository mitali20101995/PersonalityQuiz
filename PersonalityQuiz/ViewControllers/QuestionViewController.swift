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
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var questionIndex = 0
    var answersChosen: [Answer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        updatedUI()// Set visibility of views and update views
        
    }
    
    //sender type is UIButton so that can specify which button was pressed for single type question stack view
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        //print(sender.titleLabel?.text ?? "nothing")
        switch sender{
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            return
        }
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswersButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        //print("Choices submitted.")
        if multiSwitch1.isOn{
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn{
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn{
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn{
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
   
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
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
    
    func nextQuestion(){
        
        
    }
}
