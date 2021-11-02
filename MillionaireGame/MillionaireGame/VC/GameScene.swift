//
//  GameScene.swift
//  MillionaireGame
//
//  Created by Shisetsu on 27.10.2021.
//

import UIKit

protocol GameSceneDelegate: AnyObject {
    func resultSummation (_ controller: GameScene, questions: QuestionsPull)
}

final class GameScene: UIViewController {
    
    weak var gameDelegate: GameSceneDelegate?

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var answerALabel: AnswerButton!
    @IBOutlet weak var answerBLabel: AnswerButton!
    @IBOutlet weak var answerCLabel: AnswerButton!
    @IBOutlet weak var answerDLabel: AnswerButton!
    
    var question: QuestionsPull?
    var questionNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameData()
    }
    
    @IBAction func choseAnswer(_ sender: UIButton) {
        let info = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        if sender.tag == question?.correctAnswer {
            info.title = "Верно!"
            questionNumber += 1
            
            if questionNumber < questions.count {
                self.gameDelegate?.resultSummation(self, questions: question!)
                info.addAction(UIAlertAction(title: "Продолжаем", style: .default, handler: setupGameData))
                present(info, animated: true)
            } else {
                info.title = "Игра закончена"
                info.addAction(UIAlertAction(title: "На главный экран", style: .default) {
                    [weak self] _ in
                    self?.finishGame()
                })
                present(info, animated: true)
            }
        } else {
            info.title = "Ответ неверный!"
            info.addAction(UIAlertAction(title: "Игра окончена", style: .default) {
                [weak self] _ in
                self?.finishGame()
            })
            present(info, animated: true)
        }
    }
    
 
    func setupGameData(action: UIAlertAction! = nil) {
        question = questions[questionNumber]
        question?.answers.shuffle()
        
        questionLabel.text = question?.question
        
        playerNameLabel.text = "У нас в студии Игрок 1"
        
        questionNumberLabel.text = "Вопрос № \(questionNumber + 1) из 6 "
        
        answerALabel.setTitle(question?.answers[0].answer, for: .normal)
        answerALabel.tag = (question?.answers[0].id)!
        answerBLabel.setTitle(question?.answers[1].answer, for: .normal)
        answerBLabel.tag = (question?.answers[1].id)!
        answerCLabel.setTitle(question?.answers[2].answer, for: .normal)
        answerCLabel.tag = (question?.answers[2].id)!
        answerDLabel.setTitle(question?.answers[3].answer, for: .normal)
        answerDLabel.tag = (question?.answers[3].id)!
    }
    
    func finishGame() {
        Game.shared.endGame()
        self.dismiss(animated: true)
    }
}
