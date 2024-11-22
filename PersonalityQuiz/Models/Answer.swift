//
//  Answer.swift
//  PersonalityQuiz
//
//  Created by Mitali Ahir on 2024-11-22.
//

import Foundation

struct Answer{
    
    var text: String
    var type: AnimalType
}

enum AnimalType: Character{
    case lion = "🦁", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    var definition: String{
        switch self{
        case .lion:
            return "You are incredibaly outgoing and charismatic. You are a natural leader and have a strong sense of justice. You are a great communicator and have a strong sense of empathy. You are a great problem solver and have a strong sense of intuition. You are a great listener and you surround yourself with people you love and enjoy activities with friends. "
        case .cat:
            return "Mischevious, yet mild-tempered. You enjoy doing things on your own terms and have a strong sense of independence. You do not take well to criticism and have a strong sense of self-worth. "
        case .rabbit:
            return "You love everything that's soft.  You are healthy and full of energy. Always ready to help. You love to learn and have a strong sense of curiosity."
        case .turtle:
            return "You are wise beyond your years, kind, and patient. You focus on details. Slow and steady wins the race. You love to know about the world around you."
        }
        
    }

}
