//
//  ScoreTable.swift
//  MillionaireGame
//
//  Created by Shisetsu on 27.10.2021.
//

import Foundation

struct ScoreTable: Codable {
    let score: Int
    let date: Date
    let reward: Int
}
