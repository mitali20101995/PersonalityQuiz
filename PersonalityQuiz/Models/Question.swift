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
