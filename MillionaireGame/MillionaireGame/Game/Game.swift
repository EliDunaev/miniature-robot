//
//  Game.swift
//  MillionaireGame
//
//  Created by Shisetsu on 27.10.2021.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    var session: Session?
    
    var difficulty: Difficulty = .normal
    
    private let caretakerRecords = CareTaker()
 
    var score = [ScoreTable]() {
        didSet {
            caretakerRecords.saveData(toSave: score)
        }
    }
    
    private init() {
        self.score = self.caretakerRecords.loadData()
    }
    
    func recordScore(_ score: ScoreTable) {
        self.score.append(score)
    }
    
    func endGame() {
        guard let gameSession = self.session else { return }
        let answersCount = gameSession.correctAnswers
        let reward = gameSession.totalReward
        let score = ScoreTable(score: Int(answersCount.value), date: Date(), reward: reward.value)
        self.recordScore(score)
        self.session = nil
    }
    
}
