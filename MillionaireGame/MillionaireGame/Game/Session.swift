//
//  Session.swift
//  MillionaireGame
//
//  Created by Shisetsu on 27.10.2021.
//

import Foundation

class Session {
    
    var questionCount: Int = questions.count
    var correctAnswers: Int = 0
    var totalReward: Int = 0
}

extension Session: GameSceneDelegate {
    func resultSummation (_ controller: GameScene, questions: QuestionsPull) {
        self.correctAnswers += 1
        self.totalReward += questions.answerReward
    }
}
