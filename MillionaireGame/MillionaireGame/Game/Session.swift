//
//  Session.swift
//  MillionaireGame
//
//  Created by Shisetsu on 27.10.2021.
//

import Foundation

class Session {
    
    var questionCount: Int = questionsPull.count
    var correctAnswers = Observable<Int>(0)
    var totalReward = Observable<Int>(0)
}

extension Session: GameSceneDelegate {
    func resultSummation (_ controller: GameScene, questions: QuestionTable) {
        self.correctAnswers.value += 1
        self.totalReward.value += questions.answerReward
    }
}
