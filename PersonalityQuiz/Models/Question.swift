//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Mitali Ahir on 2024-11-22.
//

import Foundation

struct Question{
    
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType{
    case single, multiple, ranged
}

var questions: [Question] = [
    Question(text: "Which food do you like the most?",
             type: .single,
             answers: [Answer(text: "Steak", type: .lion),
                       Answer(text: "Fish", type: .cat),
                       Answer(text: "Carrots", type: .rabbit),
                       Answer(text: "Lettus", type: .turtle)
                      ]
            ),
    Question(text: "Which activities do you enjoy?",
             type: .multiple,
             answers: [Answer(text: "Eating", type: .lion),
                       Answer(text: "Sleeping", type: .cat),
                       Answer(text: "Cuddling", type: .rabbit),
                       Answer(text: "Swimming", type: .turtle)
                      ]
            ),
    Question(text: "How much do you enjoy car rides?",
             type: .ranged,
             answers: [Answer(text: "I love them", type: .lion),
                       Answer(text: "I dislike them", type: .cat),
                       Answer(text: "I get little nervous", type: .rabbit),
                       Answer(text: "I barely notice them", type: .turtle)
                      ]
            )
]
    
