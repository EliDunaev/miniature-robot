//
//  Questions.swift
//  MillionaireGame
//
//  Created by Shisetsu on 27.10.2021.
//

import Foundation

struct AnswersID {
    
    let id: Int
    let answer: String
    
}

struct QuestionsPull {
    
    let id: Int
    let question: String
    var answers: [AnswersID]
    let correctAnswer: Int
    var answerReward: Int
    
}

let questions: [QuestionsPull] = [
    
    QuestionsPull(id: 0, question: "Что делают участники телеигры «Поле Чудес»?", answers: [AnswersID(id: 0, answer: "A: вращают барабан"), AnswersID(id: 1, answer: "B: распрямляют саксофон"), AnswersID(id: 2, answer: "C: поднимают рояль"), AnswersID(id: 3, answer: "D: залезают в контрабас")], correctAnswer: 0, answerReward: 100),
    
    QuestionsPull(id: 1, question: "С чем сравнил герой песни Высоцкого себя и своего друга, гуляющих по Парижу?", answers: [AnswersID(id: 0, answer: "A: с дрелью на пляже"), AnswersID(id: 1, answer: "B: с пассатижами в бане"), AnswersID(id: 2, answer: "C: с отвёрткой в пустыне"), AnswersID(id: 3, answer: "D: с долотом в бассейне")], correctAnswer: 1, answerReward: 200),
    
    QuestionsPull(id: 2, question: "Что сделали тульские мастера с механической блохой в сказке «Левша»?", answers: [AnswersID(id: 0, answer: "A: запрягли"), AnswersID(id: 1, answer: "B: одели"), AnswersID(id: 2, answer: "C: подковали"), AnswersID(id: 3, answer: "D: покрасили")], correctAnswer: 2, answerReward: 2000),
    
    QuestionsPull(id: 3, question: "Что туристы бросают в фонтан Треви, чтобы вернуться в Рим?", answers: [AnswersID(id: 0, answer: "A: монеты"), AnswersID(id: 1, answer: "B: визитные карточки"), AnswersID(id: 2, answer: "C: мобильные телефоны"), AnswersID(id: 3, answer: "D: загранпаспорта")], correctAnswer: 0, answerReward: 5000),
    
    QuestionsPull(id: 4, question: "Как не характеризовали Нину в фильме «Кавказская пленница»?", answers: [AnswersID(id: 0, answer: "A: спортсменка"), AnswersID(id: 1, answer: "B: активистка"), AnswersID(id: 2, answer: "C: комсомолка"), AnswersID(id: 3, answer: "D: студентка")], correctAnswer: 1, answerReward: 50000),
    
    QuestionsPull(id: 5, question: "Кто дирижировал на балу у Воланда в романе «Мастер и Маргарита»?", answers: [AnswersID(id: 0, answer: "A: Иоганн Штраус"), AnswersID(id: 1, answer: "B: Иоганн Себастьян Бах"), AnswersID(id: 2, answer: "C: Людвиг ван Бетховен"), AnswersID(id: 3, answer: "D: Ференц Лист")], correctAnswer: 0, answerReward: 100000)
]
