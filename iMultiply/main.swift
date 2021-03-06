//
//  main.swift
//  iMultiply
//
//  Created by Kevin Sparks on 6/13/22.
//

import Foundation

enum QuestionType: CaseIterable {
    case add
    case subtact
    case multiply
}

struct Question {
    var left: Int
    var right: Int
    var operation: QuestionType
    
    var string: String {
        switch operation {
        case .add:
            return "What is \(left) plus \(right)?"
        case .subtact:
            return "What is \(left) minus \(right)?"
        case .multiply:
            return "What is \(left) multiplied by \(right)?"
        }
    }
    
    var answer: Int {
        switch operation {
        case .add:
            return left + right
        case .subtact:
            return left - right
        case .multiply:
            return left * right
        }
    }
}

extension Question {
    init() {
        left = Int.random(in: 1...12)
        right = Int.random(in: 1...12)
        operation = QuestionType.allCases.randomElement()!
    }
}

class iMultiply {
    var questionNumber = 1
    var score = 0
    var answerFunction = { readLine() }
    
    func process(_ answer: String, for question: Question) -> String {
        guard let answerInt = Int(answer) else {
            return "Error"
        }
        
        questionNumber += 1
        
        if answerInt == question.answer {
            score += 1
            return "Correct!"
        } else {
            return "Wrong!"
        }
    }
    
    func start() {
        print("Welcome to iMultiply!")
        
        repeat {
            let question = Question()
                        
            print ("\n\(questionNumber). \(question.string)")
            print("Your answer: ", terminator: "")
            
            if let answer = answerFunction() {
                let response = process(answer, for: question)
                print(response)
            }
            
        } while questionNumber <= 10
                    
        print("You scored \(score).")
    }
}

let game = iMultiply()
game.start()
