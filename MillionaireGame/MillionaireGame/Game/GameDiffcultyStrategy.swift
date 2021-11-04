//
//  GameDiffcultyStrategy.swift
//  MillionaireGame
//
//  Created by Shisetsu on 04.11.2021.
//

import Foundation

protocol  GameDiffcultyStrategy{
    func setDifficulty() -> [QuestionTable]
}

final class RandomQuestions: GameDiffcultyStrategy {
    
    func setDifficulty() -> [QuestionTable] {
        return questionsPull.shuffled()
    }
}

final class NormalQuestions: GameDiffcultyStrategy {
    func setDifficulty() -> [QuestionTable] {
        return questionsPull
    }
}
