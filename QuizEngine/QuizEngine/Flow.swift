//
//  Flow.swift
//  QuizEngine
//
//  Created by Bartek Lanczyk on 02/01/2021.
//

import Foundation

protocol Router {
    func routeTo(question: String, answerCallback: @escaping (String)->Void)
}

class Flow {
    let router: Router
    let questions: [String]
    
    init(questions: [String], router: Router) {
        self.questions = questions
        self.router = router
    }
    
    func start() {
        if let firstQuestion = questions.first {
            router.routeTo(question: firstQuestion) { [weak self] _ in
                guard let self = self else { return }
                let firstQuestionIndex = self.questions.firstIndex(of: firstQuestion)!
                let nextQuestion = self.questions[firstQuestionIndex + 1]
                self.router.routeTo(question: nextQuestion) { _ in
                    
                }
            }
        }
    }
}
