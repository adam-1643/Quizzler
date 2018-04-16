//
//  QuestionBank.swift
//  Quizzler
//
//  Created by Adam Stanislawski on 21.01.2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var list = [Question]()
 
    init() {
        
        let item = Question(text: "Rok 1914 to rok wybuchu I wojny światowej.", correctAnswer: true)
        
        list.append(item)
        
        list.append(Question(text: "Na świecie żyje ponad 10 miliardów ludzi.", correctAnswer: false))
        list.append(Question(text: "London Heathrow jest największym portem lotniczym Europy.", correctAnswer: true))
        list.append(Question(text: "5! = 120", correctAnswer: true))
        list.append(Question(text: "Szybkość dźwięku w wodzie jest mniejsza niż w powietrzu.", correctAnswer: false))
        list.append(Question(text: "Kwas, który znajduje się w naszych żołądkach to kwas solny.", correctAnswer: true))
        list.append(Question(text: "Katedra w Notre Dame jest 5-nawowa.", correctAnswer: true))
        list.append(Question(text: "\"Chłopów\" napisał Stefan Żeromski.", correctAnswer: false))
        
    }
    
    
    
}
