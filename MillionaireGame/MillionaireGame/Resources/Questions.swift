//
//  Questions.swift
//  MillionaireGame
//
//  Created by Shisetsu on 27.10.2021.
//

import Foundation

struct QuestionTable: Codable {
    var question: String
    var answers: [String]
    var correctAnswer: Int
    var answerReward: Int
}


var questionsPull: [QuestionTable] = [
    
    QuestionTable(question: "Что делают участники телеигры «Поле Чудес»?", answers: ["A: вращают барабан", "B: распрямляют саксофон", "C: поднимают рояль", "D: залезают в контрабас"], correctAnswer: 0, answerReward: 100),
    
    QuestionTable(question: "С чем сравнил герой песни Высоцкого себя и своего друга, гуляющих по Парижу?", answers: ["A: с дрелью на пляже", "B: с пассатижами в бане", "C: с отвёрткой в пустыне", "D: с долотом в бассейне"], correctAnswer: 1, answerReward: 200),

    QuestionTable(question: "Что сделали тульские мастера с механической блохой в сказке «Левша»?", answers: ["A: запрягли", "B: одели", "C: подковали", "D: покрасили"], correctAnswer: 2, answerReward: 2000),

    QuestionTable(question: "Что туристы бросают в фонтан Треви, чтобы вернуться в Рим?", answers: ["A: монеты", "B: визитные карточки", "C: мобильные телефоны", "D: загранпаспорта"], correctAnswer: 0, answerReward: 5000),

    QuestionTable(question: "Как не характеризовали Нину в фильме «Кавказская пленница»?", answers: ["A: спортсменка", "B: активистка", "C: комсомолка", "D: студентка"], correctAnswer: 1, answerReward: 50000),

    QuestionTable(question: "Кто дирижировал на балу у Воланда в романе «Мастер и Маргарита»?", answers: ["A: Иоганн Штраус", "B: Иоганн Себастьян Бах", "C: Людвиг ван Бетховен", "D: Ференц Лист"], correctAnswer: 0, answerReward: 100000)
]
